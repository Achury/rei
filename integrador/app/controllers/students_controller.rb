class StudentsController < ApplicationController
  def search
    @students = Api::Student.search(current_token, params[:name_pattern])
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def show
    @student = Api::Student.show(current_token, params[:id])
  end
end
