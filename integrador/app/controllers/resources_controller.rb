class ResourcesController < ApplicationController
  def show
    @resources = Api::Resource.all_for_course(session[:username], session[:password], params[:id])
  end
end
