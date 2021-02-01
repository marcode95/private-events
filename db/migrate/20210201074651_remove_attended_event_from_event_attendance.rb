class RemoveAttendedEventFromEventAttendance < ActiveRecord::Migration[6.0]
  def change
    remove_column :event_attendances, :attended_event, :integer
  end
end
