# frozen_string_literal: true

class Api::Participations::FixController < ApplicationController
  before_action :authenticate_user!

  def update
    if params[:id].present? && params[:id].all? {|id| current_user.events.find(Participation.find(id).event_id)}
      Participation.where(id: params[:id]).update_all(fixed: true)
      flash[:notice] = t(:"flash.success.update")
    else
      flash[:alert] = t(:"flash.failure.update")
    end
    redirect_back(fallback_location: root_path)
  end
end