class Ei::MessagesController < ApplicationController
  def show
    render :json => Interactiva::Messages.fetch(params[:username], params[:password], params[:id])
  end
end
