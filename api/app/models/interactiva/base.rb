class InvalidCourseException < StandardError; end

class Interactiva::Base
  DOMAIN = "http://interactiva.eafit.edu.co"
  BASE_URL = DOMAIN + "/ei/"
  
  # Logs in to Interactive and returns the Mechanize agent or nil if couldn't log in.
  def self.login!(username, password)
    agent = Mechanize.new
    page = agent.get(BASE_URL + "ingresar.do")
    login_form = page.form("loginForm")
    login_form.username = username
    login_form.password = password
    page = agent.submit(login_form, login_form.buttons.first)
    if page.root.text =~ /Bienvenido/
      agent
    else
      raise AuthenticationException.new("Invalid username or password")
    end
  end
  
end