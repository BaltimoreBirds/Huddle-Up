class AddColumnToLocations < ActiveRecord::Migration
  def up
    add_column :locations, :court_name, :string, null: false
    change_column :locations, :address, :string, null: false
    change_column :locations, :latitude, :integer, null: false
    change_column :locations, :longitude, :integer, null: false
  end

  def down
    remove_column :locations, :court_name, :string, null: false
    change_column :locations, :address, :string
    change_column :locations, :latitude, :integer
    change_column :locations, :longitude, :integer
  end
end
