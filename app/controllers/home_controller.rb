class HomeController < ApplicationController
  def index
    @users = User.all
    @events = Event.all
  end
end
