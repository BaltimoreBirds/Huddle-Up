class LatLongToFloat < ActiveRecord::Migration
  def change
    remove_column :locations, :latitude, :integer
    remove_column :locations, :longitude, :integer
    add_column :locations, :latitude, :float
    add_column :locations, :longitude, :float
  end
end
