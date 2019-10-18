# frozen_string_literal: true

class Api::FollowRelationsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    @follow_relation = FollowRelation.find_by(followed_id: params[:followed_id], follower_id: current_user.id)
    render json: @follow_relation
  end

  def destroy
    user = FollowRelation.find(params[:id]).followed
    current_user.unfollow(user)
    head :no_content
  end
end
