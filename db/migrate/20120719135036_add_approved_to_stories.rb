class AddApprovedToStories < ActiveRecord::Migration
  def change
  	add_column :stories, :approved, :integer, default: 0
  end
end
