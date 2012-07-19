class Story < ActiveRecord::Base
  attr_accessible :date, :description, :location, :notes, :time, :topic, :user_id, :approved
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :user_id, presence: true
  validates :topic, presence: true, length: { maximum: 100 }

  default_scope order: 'stories.created_at DESC'
end
