class RemoveCourtNameAddLocationId < ActiveRecord::Migration
  def up
    remove_column :huddles, :court, :string, null: false

  end

  def down
    add_column :huddles, :court, :string, null: false

  end
end
