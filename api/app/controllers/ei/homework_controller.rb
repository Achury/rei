class Ei::HomeworkController < ApplicationController
  def show
    render :json => Interactiva::Homework.fetch(params[:username], params[:password], params[:id])
  end
end
