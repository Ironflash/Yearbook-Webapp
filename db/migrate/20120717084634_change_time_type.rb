class ChangeTimeType < ActiveRecord::Migration
  def up
  		change_column :stories, :time, :string
  end

  def down
  		change_column :stories, :time, :time
  end
end
