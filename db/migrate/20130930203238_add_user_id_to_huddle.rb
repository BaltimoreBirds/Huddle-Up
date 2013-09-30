class AddUserIdToHuddle < ActiveRecord::Migration
  def change
    add_column :huddles, :user_id, :integer
  end
end
