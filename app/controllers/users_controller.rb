# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :following, :followers, :participations, :clips]

  def index
    @users = User.order(created_at: :desc).page(params[:page])
  end

  def show
    @participations = Participation.where(user_id: @user.following.ids).order(created_at: :desc).limit(20)
  end

  def following
    @users = @user.following.page(params[:page])
    render :show_follow
  end

  def followers
    @users = @user.followers.page(params[:page])
    render :show_follow
  end

  def participations
    @events = @user.participate_events.page(params[:page])
    render :show_participation
  end

  def clips
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

  private
    def set_user
      @user = User.find(params[:id])
    end
end
