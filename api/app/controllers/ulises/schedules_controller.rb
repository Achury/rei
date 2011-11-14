class Ulises::SchedulesController < ApplicationController
  def show
    render :json => Ulises::Schedule.fetch(params[:username], params[:password])
  end
end
