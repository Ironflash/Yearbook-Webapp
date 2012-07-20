class HomepageUpdate < ActiveRecord::Base
  attr_accessible :content

  validate :content, presence: true

  # default_scope order: 'homepage_update.created_at DESC'
end
