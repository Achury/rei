class Api::Schedule < Api::Base

  def self.show(token, course_id, group, semester)
    return [] if token.blank? or course_id.blank? or group.blank? or semester.blank?
    request = get("/pa/courses/#{course_id}/schedule", :query => { :token => token, :group => group, :semester => semester })
    begin
      request["pa"]["programacion"]["evaluacion"] || []
    rescue
      raise request["pa"]["curso"]["mensaje"]
    end
  end
  
  def self.show(username, password)
    return [] if username.blank? or password.blank?
    request = get("/ulises/schedule", :query => { :username => username, :password => password })
    puts request.parsed_response
    request.parsed_response
  end
end
