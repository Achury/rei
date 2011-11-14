class CoursesController < ApplicationController
  def show
    @grades = Api::Grade.all_for_course(session[:username], session[:password], params[:id])
  end
end
