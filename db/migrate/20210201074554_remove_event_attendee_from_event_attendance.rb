class RemoveEventAttendeeFromEventAttendance < ActiveRecord::Migration[6.0]
  def change
    remove_column :event_attendances, :event_attendee, :integer
  end
end
