module CoursesHelper
  def course_title(course, group)
    "#{course["codigo"].upcase} - #{course["nombre"]} - Grupo #{group}"
  end
  
  def current_semester
    year = Date.today.year
    semester = Date.today.month < 7 ? 1 : 2
    "#{year}#{semester}"
  end
  
  def date_distance(some_date)
    prefix = Time.now < some_date ? "Dentro de " : "Hace "
    prefix + time_ago_in_words(some_date)
  end
end
