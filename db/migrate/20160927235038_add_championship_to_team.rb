class AddChampionshipToTeam < ActiveRecord::Migration[5.0]
  def change
    add_reference :teams, :championship, foreign_key: true
  end
end
