# encoding: utf-8
class SessionsController < ApplicationController
  skip_before_filter :require_user, :only => [ :new, :create ]
  def new
  end

  def create
    if !Api::Authentication.valid_password?(params[:username], params[:password])
      redirect_to new_session_path, :alert => "Credenciales inválidas."
    else
      session[:username] = params[:username]
      session[:password] = params[:password]
      redirect_to dashboard_path, :notice => "¡Bienvenido, amigo mío!"
    end
  end

  def destroy
    session.delete(:username)
    session.delete(:password)
    redirect_to new_session_url, :notice => "Hasta la próxima."
  end
end
