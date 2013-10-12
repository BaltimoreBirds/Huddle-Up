class RemoveGmapsAddAddress < ActiveRecord::Migration
  def change
    remove_column :locations, :gmaps, :boolean
    add_column :locations, :address, :string
    remove_column :locations, :city, :string
    remove_column :locations, :state, :string
    remove_column :locations, :country, :string
  end
end
