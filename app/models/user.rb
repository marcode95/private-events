class User < ApplicationRecord
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :event_attendances, foreign_key: :event_attendee_id
  has_many :attended_events, through: :event_attendances

  validates :name, presence: true

  def attends?(event)
    attended_events.map(&:id).include?(event.id)
  end
end
