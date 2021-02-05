class EventAttendancesController < ApplicationController
  def create
    @event_attendance = EventAttendance.find_or_initialize_by(attended_event_id: event_attendance_params['event_id'], event_attendee_id: current_user.id) # rubocop: disable Layout/LineLength

    redirect_to events_path, notice: 'Attendee successfully created.' if @event_attendance.save
  end

  private

  def event_attendance_params
    params.require(:event_attendance).permit(:event_id)
  end
end
