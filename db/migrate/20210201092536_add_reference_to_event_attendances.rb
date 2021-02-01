class AddReferenceToEventAttendances < ActiveRecord::Migration[6.0]
  def change
    add_column :event_attendances, :attended_event_id, :integer, null: false, foreign_key: true
    add_column :event_attendances, :event_attendee_id, :integer, null: false, foreign_key: true
  end
end
