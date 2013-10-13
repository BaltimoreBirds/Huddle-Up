class RemoveCourtNameAddLocationId < ActiveRecord::Migration
  def up
    remove_column :huddles, :court, :string, null: false
    add_column :huddles, :location_id, :integer, null: false
  end

  def down
    add_column :huddles, :court, :string, null: false
    remove_column :huddles, :location_id, :integer, null: false
  end
end
