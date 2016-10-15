class AddGoalsLocalTeamGoalsVisitantTeamToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :goals_local_team, :integer
    add_column :matches, :goals_visitant_team, :integer
  end
end
