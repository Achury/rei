class Ulises::Grades < Ulises::Base
  def self.fetch(username, password)
    agent = login!(username, password)
    page = agent.get(BASE_URL + "consultas/inicializarNotas.do")
    form = page.form("historiaAcademicaForm")
    form.semestre = [current_semester]
    page = agent.submit(form, form.buttons.first)
    extract(page)
  end
  
  private
  
  def self.current_semester
    year = Date.today.year
    semester = Date.today.month <= 6 ? "1" : "2"
    "#{year}#{semester}"
  end
  
  def self.extract(page)
    tables = page.search("#resultado > table")[1..-1]
    tables.map do |table|
      rows = table.search("./tr")
      course = {}
      course[:course]            = rows[0].search("td")[1].text.strip
      # rows[1] is credits. We don't care
      # rows[2] is group. We don't care
      course[:graded_percentage] = rows[3].search("td")[1].text.strip
      # rows[4] is 100% grade. We don't care
      course[:average_grade]     = rows[5].search("td")[1].text.strip
      # rows[6] is silly title. Fucking engineers.
      course[:grades] = rows[7].search("tr")[1..-1].map do |inner_row|
        assignment = {}
        assignment[:assignment] = inner_row.search("td")[0].text.strip
        assignment[:grade]      = inner_row.search("td")[1].text.strip
        assignment[:percentage] = inner_row.search("td")[2].text.strip
        assignment
      end
      course
    end
  end
end