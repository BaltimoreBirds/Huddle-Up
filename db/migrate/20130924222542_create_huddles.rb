class CreateHuddles < ActiveRecord::Migration
  def change
    create_table :huddles do |t|
      t.integer :num_of_ballers_currently, null: false
      t.string :skill_level, null: false
      t.integer :size_of_huddle, null: false

      t.timestamps
    end
  end
end
