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

  def search
    if params[:keyword].present? || params[:genre].present? || params[:region].present?
      @users = User.search(params).page(params[:page])
      render :index
    else
      redirect_to users_url
    end
  end
end
