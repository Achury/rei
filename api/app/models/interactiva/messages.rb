class Interactiva::Messages < Interactiva::Base
  def self.fetch(username, password, course_code)
    agent = login!(username, password)
    link = agent.page.links.find { |l| l.text =~ /#{course_code}/i }
    raise InvalidCourseException.new("Course not found on Interactiva") if link.blank?
    page = link.click # All right, now we are inside the course.
    page = page.links.find { |l| l.text =~ /Correo/i }.click
    extract(page, agent)
  end
  
  private
  
  def self.extract(page, agent)
    table = page.search("table#correo")
    rows = table.xpath("./tbody/tr")
    rows.map do |row|
      cells = row.xpath("./td")
      
      message = {}
      message[:subject] = cells[2].text.strip
      message[:from]    = cells[3].text.strip
      message[:sent_at] = cells[4].text.strip
      
      body_url = BASE_URL + "correo/" + cells[2].search("a").first.attr("href")
      message[:body]    = extract_message(agent.get(body_url))
      message
    end
  end
  
  def self.extract_message(page)
    table = page.search("table.tablacontenidos")
    rows = table.search("./tr")
    rows.search("a").each do |a|
      a["href"] = DOMAIN + a["href"] unless a["href"].starts_with?(/http(s)+:\/\//)
    end
    rows[4].search("td").children.to_html.strip
  end
end