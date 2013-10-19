class CreateLocations < ActiveRecord::Migration
  create_table "locations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "street",     null: false
    t.integer  "postal",     null: false
    t.string   "court_name", null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "city",       null: false
    t.string   "state",      null: false

    t.timestamps
  end
end
