class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_token, :logged_in?
  before_filter :require_user
    
  protected

  def current_username
    session[:username]
  end
  
  def logged_in?
    current_username.present?
  end
  
  def require_user
    redirect_to new_session_path, :notice => "Tienes que autenticarte primero" unless logged_in?
  end
  

end
