# frozen_string_literal: true

class Api::Participations::FixController < ApplicationController
  before_action :authenticate_user!

  def update
    if params[:id].all? {|id| current_user.events.find(Participation.find(id).event_id)}
      Participation.where(id: params[:id]).update_all(fixed: true)
    end
    redirect_back(fallback_location: root_path)
  end
end