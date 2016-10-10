class AddMatchDurationMatchesSimultaniusGameDaysToChampionship < ActiveRecord::Migration[5.0]
  def change
    add_column :championships, :match_duration, :string
    add_column :championships, :matches_simultanius, :integer
    add_column :championships, :game_days, :string
  end
end
