class CoursesController < ApplicationController
  include CoursesHelper
  
  def show
    @course = Api::Course.show(current_token, params[:id])
    @students = Api::Student.all(current_token, params[:id], params[:group])
    @schedule = Api::Schedule.show(current_token, params[:id], params[:group], current_semester)
  rescue => e
    redirect_to dashboard_path, :alert => e.message
  end
  
end
