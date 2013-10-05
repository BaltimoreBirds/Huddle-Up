class UpdateAddressInLocation < ActiveRecord::Migration
  def up
    remove_column :locations, :address, :string
    add_column :locations, :city, :string
    add_column :locations, :state, :string
    add_column :locations, :country, :string
  end

  def down
    add_column :locations, :address, :string
    remove_column :locations, :city, :string
    remove_column :locations, :state, :string
    remove_column :locations, :country, :string
  end
end
