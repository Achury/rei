class Api::Authentication < Api::Base

  def self.valid_password?(username, password)
    return false if username.blank? or password.blank?
    request = get("/ulises/schedule", :query => { :username => username, :password => password })
    puts request
    return request.parsed_response.is_a?(Array) # If it's valid, the API call will return an array. Otherwise, will return a hash.
  end


end