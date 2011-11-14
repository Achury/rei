class Api::Student < Api::Base

  def self.all(token, course_id, group)
    return [] if token.blank? or course_id.blank? or group.blank?
    request = get("/ei/courses/#{course_id}/students", :query => { :token => token, :group => group })
    [request["ei"]["curso"]["estudiante"]].flatten.compact
  end
  
  def self.search(token, name_pattern)
    return [] if token.blank? or name_pattern.blank?
    request = get("/ar/students/search", :query => { :token => token, :name_pattern => name_pattern })
    [request["ar"]["estudiante"]].flatten.compact
  end
  
  
  def self.show(token, student_id)
    return nil if token.blank? or student_id.blank?
    request = get("/ar/students/#{student_id}", :query => { :token => token, :student_id => student_id })
    student = [request["ar"]["estudiante"]].flatten.first
    student["cursos"]["curso"] = [student["cursos"]["curso"]].flatten.compact
    student
  end
end