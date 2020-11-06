class PicturesController < ApplicationController
  
  def new
    @event = Event.find(params[:event_id])
  end
  def create
    @event = Event.find(params[:event_id])
    @event.picture.attach(params[:picture])
    redirect_to event_path(@event.id)
  end
end
