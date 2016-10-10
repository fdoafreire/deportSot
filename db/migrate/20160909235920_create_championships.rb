class CreateChampionships < ActiveRecord::Migration[5.0]
  def change
    create_table :championships do |t|
      t.text :name
      t.integer :quantity_min_teams
      t.datetime :date_initial_inscription
      t.datetime :date_end_inscription

      t.timestamps
    end
  end
end
