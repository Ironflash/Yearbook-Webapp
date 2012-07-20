class Comment < ActiveRecord::Base
  attr_accessible  :content, :story_id
  belongs_to :story
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 255}

  default_scope order: 'comments.created_at DESC'
end
