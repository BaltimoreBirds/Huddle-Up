class AddDateAndTimeToHuddle < ActiveRecord::Migration
  def up
    add_column :huddles, :time_and_date, :datetime, null: false
  end

  def down
    remove_column :huddles, :time_and_date, :datetime, null: false
  end
end
