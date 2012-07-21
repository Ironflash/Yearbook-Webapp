class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :time
      t.string :date
      t.string :location
      t.text :note
      t.string :duration
      t.string :attendees

      t.timestamps
    end
    add_index :meetings, [:created_at]
  end
end
