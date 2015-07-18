class CreateDuels < ActiveRecord::Migration
  def change
    create_table :duels do |t|
      t.integer :winner, null: false
      t.integer :loser, null: false
      t.date :date, null: false
      t.integer :life_points
      t.text :content

      t.timestamps null: false
    end

    add_index :duels, :winner
    add_index :duels, :loser
  end
end
