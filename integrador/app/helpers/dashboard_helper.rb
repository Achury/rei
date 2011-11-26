# encoding: utf-8
module DashboardHelper
  def extract_code(some_course)
    some_course.split("-").first.strip
  end
  
  def extract_name(some_course)
    UnicodeUtils.downcase(some_course.split("-")[1..-1].join("-").strip).humanize
  end
  
  def format_day(day)
    map = { "L" => "Lunes", "M" => "Martes", "W" => "Miércoles",
            "J" => "Jueves", "V" => "Viernes", "S" => "Sábado",
            "D" => "Domingo"}
    map[day]
  end
end
