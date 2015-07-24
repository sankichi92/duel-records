class AddRateColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rating, :integer, default: 1500, null: false
  end
end
