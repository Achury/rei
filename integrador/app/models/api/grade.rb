class Api::Grade < Api::Base

  def self.all_for_course(username, password, course_code)
    return [] if username.blank? or password.blank? or course_code.blank?
    request = get("/ulises/grades", :query => { :username => username, :password => password })
    request.select { |row| row["course"] =~ /#{course_code}/i }.first
  end

  private 

end