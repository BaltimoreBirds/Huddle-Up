class CreateHuddleUsers < ActiveRecord::Migration
  def change
    create_table :huddle_users do |t|
      t.integer :user_id
      t.integer :huddle_id

      t.timestamps
    end
  end
end
