class CreateHuddles < ActiveRecord::Migration
  def change
    create_table "huddles", force: true do |t|
      t.string   "skill_level",    null: false
      t.string   "size_of_huddle", null: false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "creator",        null: false
      t.datetime "time_and_date",  null: false
      t.integer  "user_id"
      t.integer  "location_id"

      t.timestamps
    end

  end
end
