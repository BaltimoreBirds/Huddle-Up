class UpdateSchema < ActiveRecord::Migration
  def up
    remove_column :huddles, :user_id, :integer
    add_column :huddles, :creator, :integer, null: false
  end

  def down
    add_column :huddles, :user_id, :integer
    remove_column :huddles, :creator, :integer, null: false
  end
end
