class UsersController < ApplicationController

  def index
    @users = User.order(created_at: :desc).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following
    render :show_follow
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render :show_follow
  end

  def participations
    @user  = User.find(params[:id])
    @events = @user.events.page(params[:page])
    render :show_participation
  end

  def clips
    @user  = User.find(params[:id])
    @events = @user.clip_events.page(params[:page])
    render :show_clip
  end
end
