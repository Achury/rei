class Ei::ResourcesController < ApplicationController
  def show
    render :json => Interactiva::Resources.fetch(params[:username], params[:password], params[:id])
  end  
end
