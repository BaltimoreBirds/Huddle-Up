class AddJoinRemoveLocationIdFromHuddle < ActiveRecord::Migration
  def change
    create_table :huddle_locations do |t|
      t.integer :huddle_id, null: false
      t.integer :location_id, null: false

      t.timestamps
    end

    remove_column :huddles, :location_id, :integer
  end
end
