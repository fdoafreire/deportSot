class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :telefono
      t.string :email
      t.string :movil
      t.string :number_id
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
