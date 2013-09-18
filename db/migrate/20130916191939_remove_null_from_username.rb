class RemoveNullFromUsername < ActiveRecord::Migration
  def up
    change_column :users, :username, :string, null: true
    remove_column :users, :password, :string, null: false
  end

  def down
    change_column :users, :username, :string, null: false
    add_column :users, :password, :string, null: false
  end
end
