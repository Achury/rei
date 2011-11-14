class Interactiva::Resources < Interactiva::Base
  def self.fetch(username, password, course_code)
    agent = login!(username, password)
    link = agent.page.links.find { |l| l.text =~ /#{course_code}/i }
    raise InvalidCourseException.new("Course not found on Interactiva") if link.blank?
    page = link.click # All right, now we are inside the course.
    page = page.links.find { |l| l.text =~ /Contenidos/i }.click
    extract(page, agent)
  end
  
  private
  
  def self.extract(page, agent)
    tables = page.search("table.tablacontenidos")
    tables.map do |table|
      cell = table.xpath("./tr/td")[1]
      folder_link = table.search("a").select { |l| l.text =~ /Abrir Carpeta/i }.first
      if folder_link.present? #  is a folder. Recursively list its contents.
        url = DOMAIN + folder_link.attr("href")
        puts url
        subpage = agent.get(url)
        resource = {}
        resource[:title] = cell.search("span.titulo").text.strip.gsub("Abrir Carpeta", "")
        resource[:content] = extract(subpage, agent)
        resource[:leaf] = false
        resource
      else # It's not a folder
        resource = {}
        resource[:title] = cell.search("span.titulo").text.strip
        resource[:description] = cell.search("p").first.text.strip if cell.search("p").first
        resource[:content] = cell.search("a").map { |link| { :text => link.text.strip, :url => link.attr("href") } }
        resource[:leaf] = true
        resource
      end
    end
  end
end