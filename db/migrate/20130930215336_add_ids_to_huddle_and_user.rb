class AddIdsToHuddleAndUser < ActiveRecord::Migration
  def change
    add_column :users, :huddle_id, :integer
  end
end
