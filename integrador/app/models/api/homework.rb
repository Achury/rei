class Api::Homework < Api::Base
  def self.all_for_course(username, password, course_code)
    return [] if username.blank? or password.blank? or course_code.blank?
    request = get("/ei/homework/#{course_code}", :query => { :username => username, :password => password })
  end
end