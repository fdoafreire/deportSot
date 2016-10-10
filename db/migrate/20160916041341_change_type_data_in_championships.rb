class ChangeTypeDataInChampionships < ActiveRecord::Migration[5.0]
  def change
  	change_column :championships, :name, :string
  end
end
