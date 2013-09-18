class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password, null: false
      t.string :email, null: false
      t.string :skill
      t.string :city, null: false

      t.timestamps
    end
  end
end
