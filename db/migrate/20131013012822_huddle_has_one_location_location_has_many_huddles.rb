class HuddleHasOneLocationLocationHasManyHuddles < ActiveRecord::Migration
  def change
    drop_table :huddle_locations
    add_column :huddles, :location_id, :integer
  end
end
