class RemoveNullFromCourtName < ActiveRecord::Migration
  def up
    remove_column :locations, :court_name, :string, null: false
    add_column :locations, :court_name, :string
  end

  def down
    remove_column :locations, :court_name, :string
    add_column :locations, :court_name, :string, null: false

  end
end
