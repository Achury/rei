class AuthenticationException < StandardError; end

class Schedule
  
  BASE_URL = "http://webapps.eafit.edu.co/ulises/"
  
  def self.fetch(username, password)
    agent = login!(username, password)
    page = agent.get(BASE_URL + "consultas/consultaHorarios.do")
    extract(page)
  end

  # Logs in to Ulises and returns the Mechanize agent or nil if couldn't log in.
  def self.login!(username, password)
    agent = Mechanize.new
    page = agent.get(BASE_URL + "login.do")
    login_form = page.form("loginForm")
    login_form.login = username
    login_form.clave = password
    page = agent.submit(login_form, login_form.buttons.first)
    if page.root.text =~ /Bienvenido/
      agent
    else
      raise AuthenticationException.new("Invalid username or password")
    end
  end

  private
  
  # Receives the schedule page and returns a nicely formatted hash with the schedule.
  def self.extract(page)
    table = page.search("form[name=estudianteForm] table.texto")[1]
    rows = table.search("./tr")[1..-1]
    schedule = rows.map do |row|
      cells = row.search("./td")
      course = {}
      course[:course]      = cells[0].text
      course[:group]       = cells[1].text
      course[:credits]     = cells[2].text
      course[:rooms]       = cells[3].search("td").map { |t| t.text }
      course[:hours]       = cells[4].search("td").map { |t| t.text }
      course[:days]        = cells[5].search("td").map { |t| t.text }
      course[:start_dates] = cells[6].search("td").map { |t| t.text }
      course[:end_dates]   = cells[7].search("td").map { |t| t.text }
      # cells[8] is how many times you have seen this course. We don't care.
      course[:campus]      = cells[9].search("td").map { |t| t.text }
      course
    end
    puts schedule
    nil
  end

end