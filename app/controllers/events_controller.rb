class EventsController < ApplicationController
  def index
    @events = Event.all
    @before = Event.before
    @after = Event.after
    @event_attendance = EventAttendance.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @user = User.find(current_user.id)
    @event = @user.created_events.build(event_params)

    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
