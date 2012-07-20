class CreateHomepageUpdates < ActiveRecord::Migration
  def change
    create_table :homepage_updates do |t|
      t.string :content

      t.timestamps
    end
    add_index :homepage_updates, [:created_at]
  end
end
