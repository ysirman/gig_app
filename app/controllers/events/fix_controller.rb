# frozen_string_literal: true

class Events::FixController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user

  def update
    @event.update(fixed: true)
    redirect_to @event, notice: t(:"flash.success.update")
  end

  private
    def correct_user
      @event = current_user.events.find_by(id: params[:id])
      redirect_to root_url if @event.nil?
    end
end