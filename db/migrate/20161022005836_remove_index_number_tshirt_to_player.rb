class RemoveIndexNumberTshirtToPlayer < ActiveRecord::Migration[5.0]
  def change
  	remove_index :players, 'tshirt_number'
  end
end
