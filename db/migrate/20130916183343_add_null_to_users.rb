class AddNullToUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.change :username, :string, null: false
      t.change :password, :string, null: false
      t.change :email, :string, null: false
      t.change :skill, :string
      t.change :city, :string, null: false

    end
  end

  def down
    change_table :users do |t|
      t.change :username, :string
      t.change :password, :string
      t.change :email, :string
      t.change :skill, :string
      t.change :city, :string
    end
  end
end
