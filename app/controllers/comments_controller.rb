# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:index, :create]

  def index
    @comment = Comment.new
    @event = Event.find(params[:event_id])
    @comments = @event.comments.order(created_at: :desc).page(params[:page])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to event_path(params[:event_id]), notice: t(:"flash.success.create")
    else
      @event = Event.find(params[:event_id])
      @comments = @event.comments.order(created_at: :desc).limit(10)
      render "events/show"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(
        :description,
        :event_id)
    end

    def correct_user
      event = Event.find(params[:event_id])
      participation = current_user.participations.find_by(event_id: params[:event_id])
      unless current_user == event.user || (participation && participation.fixed)
        redirect_to event_path(params[:event_id]), alert: "権限がありません。"
      end
    end
end