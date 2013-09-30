class AddNullfalseToCourtColumn < ActiveRecord::Migration
  def up
    change_column :huddles, :court, :string, null: false
  end
  def down
    change_column :huddles, :court, :string
  end
end
