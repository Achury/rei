class DashboardsController < ApplicationController
  def show
    @schedule = Api::Schedule.show(session[:username], session[:password])
    puts "Schedule is #{@schedule}"
  end
end
