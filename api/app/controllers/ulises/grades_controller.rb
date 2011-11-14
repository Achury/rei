class Ulises::GradesController < ApplicationController
  def index
    render :json => Ulises::Grades.fetch(params[:username], params[:password])
  end  
end
