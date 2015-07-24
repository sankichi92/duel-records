class AddRateColumnToUsers < ActiveRecord::Migration
  def change
    add_column :duels, :rate, :integer, default: 1500, null: false
  end
end
