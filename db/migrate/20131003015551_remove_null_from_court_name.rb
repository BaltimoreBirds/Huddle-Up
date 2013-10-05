class RemoveNullFromCourtName < ActiveRecord::Migration
  def up
    change_column :locations, :court_name, :string
  end

  def down
    change_column :locations, :court_name, :string, null: false
  end
end
