class CreateDetailsMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :details_matches do |t|
      t.references :match, foreign_key: true
      t.references :team, foreign_key: true
      t.references :player, foreign_key: true
      t.references :event, foreign_key: true
      t.integer :minute

      t.timestamps
    end
  end
end
