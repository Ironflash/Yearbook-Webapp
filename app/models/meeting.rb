class Meeting < ActiveRecord::Base
  attr_accessible :attendees, :date, :duration, :location, :note, :time

  validates :date, presence: true
  validates :time, presence: true
  validates :location, presence: true, length: { maximum: 140 }
  validates :duration, presence: true, length: { maximum: 140 } 

  default_scope order: 'meetings.created_at DESC'
end
