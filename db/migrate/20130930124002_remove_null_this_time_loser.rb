class RemoveNullThisTimeLoser < ActiveRecord::Migration
  def up
    remove_column :huddles, :num_of_ballers_currently, :string, null: false
    add_column :huddles, :num_of_ballers_currently, :integer
  end

  def down
    remove_column :huddles, :num_of_ballers_currently, :integer
    add_column :huddles, :num_of_ballers_currently, :string, null: false
  end
end
