class Api::Course < Api::Base

  def self.all(token)
    return [] if token.blank?
    request = get("/ei/courses", :query => { :token => token })
    [(request["ei"]["cursos"] || {"curso" => []} )["curso"]].flatten
  end
  
  def self.show(token, course_id)
    return nil if token.blank?
    request = get("/ei/courses/#{course_id}", :query => { :token => token })
    if request["ei"]["curso"]["mensaje"].present?
      raise request["ei"]["curso"]["mensaje"]
    else
      request["ei"]["curso"]["modulo"] = [request["ei"]["curso"]["modulo"]].flatten
      request["ei"]["curso"]
    end
  end

  private 

end