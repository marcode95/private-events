class Event < ApplicationRecord
  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'
  has_many :event_attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendances, source: :event_attendee
  scope :before, -> { where('date < ?', Date.today) }
  scope :after, -> { where('date > ?', Date.today) }
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
end
