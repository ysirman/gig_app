class Api::ClipsController < ApplicationController
  before_action :authenticate_user!

  def create
    event = Event.find(params[:event_id])
    current_user.clip_events << event
    @clip = current_user.clips.find_by(event_id: params[:event_id])
    render json: @clip
  end

  def destroy
    Clip.find(params[:id]).destroy
    head :no_content
  end
end
