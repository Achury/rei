class MessagesController < ApplicationController
  def show
    @messages = Api::Message.all_for_course(session[:username], session[:password], params[:id])
  end
end
