class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :topic
      t.integer :user_id
      t.date :date
      t.time :time
      t.string :location
      t.text :description
      t.text :notes

      t.timestamps
    end
    add_index :stories, [:user_id, :created_at,:date]
  end
end
