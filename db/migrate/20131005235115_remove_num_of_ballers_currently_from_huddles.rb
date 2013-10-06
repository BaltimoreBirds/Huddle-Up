class RemoveNumOfBallersCurrentlyFromHuddles < ActiveRecord::Migration
  def change
    remove_column :huddles, :num_of_ballers_currently, :integer
  end
end
