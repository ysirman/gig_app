class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    # @event.user_id = current_user.user_id
    @event.user_id = "hogege"
    if @event.save
      redirect_to @event, notice: t(:"flash.success.create")
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: t(:"flash.success.update")
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: t(:"flash.success.destroy")
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(
        :title, 
        :gig_date, 
        :user_id, 
        :target_join_num, 
        :region, 
        :place, 
        :target_price, 
        :description)
    end
end
