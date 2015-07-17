class Duel < ActiveRecord::Base
  validates :winner, presence: true
  validates :loser, presence: true
  validates :date, presence: true
  validates :life_points, numericality: { only_integer: true, greater_than: 0 }
  validates :content, length: { maximum: 2000 }
  validate :winner_and_loser_should_be_different

  private

  def winner_and_loser_should_be_different
    return unless winner && loser

    if winner == loser
      errors.add('勝者と敗者は異なるアカウントに設定してください')
    end
  end
end
