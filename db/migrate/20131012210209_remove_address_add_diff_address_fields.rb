class RemoveAddressAddDiffAddressFields < ActiveRecord::Migration
  def change
    remove_column :locations, :address, :string
    add_column :locations, :city, :string
    add_column :locations, :state, :string
  end
end
