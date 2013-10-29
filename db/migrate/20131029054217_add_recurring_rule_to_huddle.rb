class AddRecurringRuleToHuddle < ActiveRecord::Migration
  def change
    add_column :huddles, :recurring_rule, :string
  end
end
