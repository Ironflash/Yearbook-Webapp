class ChangeChildIdToCommentId < ActiveRecord::Migration
  def up
  	remove_column :comments, :child_comment_id
  	add_column :comments, :comment_id, :integer
  end

  def down
  	remove_column :comments, :comment_id
  	add_column :comments, :child_comment_id, :integer
  end
end
