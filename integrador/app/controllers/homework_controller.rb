class HomeworkController < ApplicationController
  def show
    @homework = Api::Homework.all_for_course(session[:username], session[:password], params[:id])
  end
end
