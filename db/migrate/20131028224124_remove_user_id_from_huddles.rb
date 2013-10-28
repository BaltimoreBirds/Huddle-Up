class RemoveUserIdFromHuddles < ActiveRecord::Migration
  def change
    remove_column :huddles, :user_id, :integer
  end
end
