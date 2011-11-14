class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :require_credentials
  
  rescue_from "AuthenticationException", "InvalidCourseException" do |exception|
    render :json => { :error => exception.message }
  end

  protected
  
  def require_credentials
    if params[:username].blank? or params[:password].blank?
      render :json => { :error => "Missing username or password" }
    end
  end
end
