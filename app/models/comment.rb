class Comment < ActiveRecord::Base
  attr_accessible :child_comment_id, :content, :parent_comment_id, :story_id
  belongs_to :story

  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 255}

  default_scope order: 'comments.created_at DESC'
end
