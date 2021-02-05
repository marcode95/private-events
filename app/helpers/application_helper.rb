module ApplicationHelper
  def attendance_form(event)
    render 'events/event_attendance_form', event: event unless current_user.attends?(event)
  end
end
