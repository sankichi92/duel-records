class UpdateDuels < ActiveRecord::Migration
  def change
    change_column_null :duels, :winner_id, true
    change_column_null :duels, :loser_id, true
  end
end
