# frozen_string_literal: true

class Api::ParticipationsController < ApplicationController
  before_action :authenticate_user!

  def create
    event = Event.find(params[:event_id])
    current_user.participate_events << event
    @participation = current_user.participations.find_by(event_id: params[:event_id])
    render json: @participation
  end

  def destroy
    Participation.find(params[:id]).destroy
    head :no_content
  end
end
