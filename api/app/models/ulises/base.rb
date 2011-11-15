class AuthenticationException < StandardError; end

class Ulises::Base
    BASE_URL = "http://webapps.eafit.edu.co/ulises/"
    
    # Logs in to Ulises and returns the Mechanize agent or nil if couldn't log in.
    def self.login!(username, password)
      agent = Mechanize.new
      page = agent.get(BASE_URL + "login.do")
      login_form = page.form("loginForm")
      login_form.login = username
      login_form.clave = password
      page = agent.submit(login_form, login_form.buttons.first)
      if page.root.text =~ /Bienvenido/ or page.root.to_html =~ /\/ulises\/consultas\/index.do/i
        agent
      else
        raise AuthenticationException.new("Invalid username or password")
      end
    end
end