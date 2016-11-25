class AddStatusToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :status, :integer, :limit => 1, :default => 0
  end
end
