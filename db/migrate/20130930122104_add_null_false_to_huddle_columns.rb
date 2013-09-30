class AddNullFalseToHuddleColumns < ActiveRecord::Migration
  def up
    change_column :huddles, :num_of_ballers_currently, :string, null: false
    change_column :huddles, :skill_level, :string, null: false
    change_column :huddles, :size_of_huddle, :string, null: false
  end
  def down
    change_column :huddles, :num_of_ballers_currently, :string, null: false
    change_column :huddles, :skill_level, :string, null: false
    change_column :huddles, :size_of_huddle, :string, null: false
  end
end
