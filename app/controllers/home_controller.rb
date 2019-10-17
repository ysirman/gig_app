class HomeController < ApplicationController
  def index
    @users = User.order(created_at: "DESC").limit(4)
    @events = Event.order(created_at: "DESC").limit(3)
  end
  
  def disclaimer
  end

  def about
  end
end
