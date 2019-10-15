class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @events = Event.all.order(gig_date: :desc).page(params[:page])
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
    @event.user_id = current_user.id
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

  def search
    if params[:keyword].present? || params[:gig_date].present? || params[:region].present?
      @events = Event.search(params).page(params[:page])
      render :index
    else
      redirect_to events_url
    end
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(
        :title, 
        :genre,
        :gig_date, 
        :target_join_num, 
        :region, 
        :location, 
        :target_price, 
        :description)
    end

    def correct_user
      @event = current_user.events.find_by(id: params[:id])
      redirect_to root_url if @event.nil?
    end
end
