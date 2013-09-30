class AddCourtColumnToHuddleTable < ActiveRecord::Migration
  def change
    add_column :huddles, :court, :string
  end
end
