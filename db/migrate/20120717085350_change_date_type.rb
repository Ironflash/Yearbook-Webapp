class ChangeDateType < ActiveRecord::Migration
  def up
  	change_column :stories, :date, :string
  end

  def down
  	change_column :stories, :date, :date
  end
end
