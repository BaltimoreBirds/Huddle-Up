class CreateHuddleUsers < ActiveRecord::Migration
  def change
    create_table :huddle_users do |t|
      t.integer :user_id, null: false
      t.integer :huddle_id, null: false

      t.timestamps
    end
  end
end
