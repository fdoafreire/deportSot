class AddInfoOfPenaltyToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :yellow_cards, :integer, :limit => 1, :default => 0
    add_column :players, :red_cards, :integer,:limit => 1, :default => 0
    add_column :players, :penalized_matches, :integer,:limit => 1, :default => 0
    add_column :players, :matches_without_playing, :integer,:limit => 1, :default => 0
  end
end
