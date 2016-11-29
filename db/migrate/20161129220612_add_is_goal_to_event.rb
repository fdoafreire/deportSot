class AddIsGoalToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :is_goal, :integer,:limit => 1, :default => 0
  end
end
