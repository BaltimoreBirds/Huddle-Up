class NullFalseToAddressFields < ActiveRecord::Migration
  def change
    change_column :locations, :street, :string, null: false
    change_column :locations, :city, :string, null: false
    change_column :locations, :state, :string, null: false
    change_column :locations, :postal, :integer, null: false
    change_column :locations, :court_name, :string, null: false
  end
end
