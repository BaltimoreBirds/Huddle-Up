class RemoveNullFalseFromBallersCurrently < ActiveRecord::Migration
  def up
    change_column :huddles, :num_of_ballers_currently, :integer
  end

  def down
    change_column :huddles, :num_of_ballers_currently, :integer, null: false
  end
end
