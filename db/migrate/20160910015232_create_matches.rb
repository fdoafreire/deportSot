class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :local_id, :references => "match", foreign_key: true
      t.integer :visitant_id, :references => "match", foreign_key: true
      t.datetime :match_date
      t.integer :date_number
      t.references :championship, foreign_key: true

      t.timestamps
    end
  end
end
