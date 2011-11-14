class Interactiva::Homework < Interactiva::Base
  def self.fetch(username, password, course_code)
    agent = login!(username, password)
    link = agent.page.links.find { |l| l.text =~ /#{course_code}/i }
    raise InvalidCourseException.new("Course not found on Interactiva") if link.blank?
    page = link.click # All right, now we are inside the course.
    page = page.links.find { |l| l.text =~ /Entrega Trabajos/i }.click
    extract(page)
  end
  
  
  private
  
  def self.extract(page)
    tables = page.search("table.tablacontenidos")
    tables.map do |table|
      rows = table.search("./tr")
      puts rows
      homework = {}
      homework[:title]       = rows[0].search("td span.titulo").text.strip
      homework[:start_date]  = rows[0].search("td")[1].search("b")[0].text.gsub("Fecha Inicio:", "").strip
      homework[:end_date]    = rows[0].search("td")[1].search("b")[1].text.gsub("Fecha Fin:", "").strip
      homework[:status]      = rows[0].search("td")[1].search("div").text.strip
      homework[:description] = rows[1].search("td")[0].search("p").to_html.strip
      
      homework[:status].gsub!("CERRADO", "Closed")
      homework[:status].gsub!("ABIERTO", "Open")
      homework
    end
  end
end