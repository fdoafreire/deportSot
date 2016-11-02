class AddIndexNumberTshirtToPlayer < ActiveRecord::Migration[5.0]
  def change
  	add_index :players, [:tshirt_number, :team_id]
  end
end
