class AddNumberTshirtToPlayer < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :tshirt_number, :integer
    add_index :players, :tshirt_number, unique: true
  end
end
