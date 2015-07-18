class Duel < ActiveRecord::Base
  belongs_to :winner, class_name: 'User'
  belongs_to :loser, class_name: 'User'

  validates :winner_id, presence: true
  validates :loser_id, presence: true
  validates :date, presence: true
  validates :life_points, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true
  validates :content, length: { maximum: 2000 }
  validate :winner_and_loser_should_be_different

  private

  def winner_and_loser_should_be_different
    return unless winner && loser

    if winner == loser
      errors.add(:loser, 'は勝者と異なるアカウントに設定してください')
    end
  end
end
