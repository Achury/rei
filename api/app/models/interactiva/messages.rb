class Interactiva::Messages < Interactiva::Base
  def self.fetch(username, password, course_code)
    agent = login!(username, password)
    link = agent.page.links.find { |l| l.text =~ /#{course_code}/i }
    raise InvalidCourseException.new("Course not found on Interactiva") if link.blank?
    page = link.click # All right, now we are inside the course.
    page = page.links.find { |l| l.text =~ /Correo/i }.click
    extract(page)
  end
  
  private
  
  def self.extract(page)
    table = page.search("table#correo")
    rows = table.xpath("./tbody/tr")
    rows.map do |row|
      cells = row.xpath("./td")
      
      message = {}
      message[:subject] = cells[2].text.strip
      message[:from]    = cells[3].text.strip
      message[:sent_at] = cells[4].text.strip
      message
    end
  end
end