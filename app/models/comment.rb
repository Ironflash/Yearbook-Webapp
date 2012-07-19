class Comment < ActiveRecord::Base
  attr_accessible :comment_id, :content, :parent_comment_id, :story_id
  belongs_to :story
  belongs_to :user
  has_many :comments
  belongs_to :comment

  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 255}

  default_scope order: 'comments.created_at DESC'
end
