class Event < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, class_name: :User

  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, source: :event_attendee

  scope :previous_events, -> { where("event_date < :current_date", current_date: Date.current) }
  scope :upcomming_events, -> { where("event_date >= :current_date", current_date: Date.current) }
end
