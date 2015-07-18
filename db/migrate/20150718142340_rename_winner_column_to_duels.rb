class RenameWinnerColumnToDuels < ActiveRecord::Migration
  def change
    rename_column :duels, :winner, :winner_id
    rename_column :duels, :loser, :loser_id
  end
end
