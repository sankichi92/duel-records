class Duel < ActiveRecord::Base
  belongs_to :winner, class_name: 'User'
  belongs_to :loser, class_name: 'User'

  after_create :calculate_rating
  after_update :calculate_all_ratings
  after_destroy :calculate_all_ratings

  validates :winner_id, presence: true
  validates :loser_id, presence: true
  validates :date, presence: true
  validates :life_points, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true
  validates :content, length: { maximum: 2000 }
  validate :winner_and_loser_should_be_different

  scope :played_by, ->(user_id) { where(['winner_id = ? OR loser_id = ?', "#{user_id}", "#{user_id}"]) }

  private

  def calculate_rating
    w = winner.rating
    l = loser.rating
    e = 1 / (10**((l - w) / 1000) + 1)
    w += 16 * (3 - e)
    l += 16 * (0 - (1 - e))
    winner.update_attribute(:rating, w)
    loser.update_attribute(:rating, l)
  end

  def calculate_all_ratings
    User.calculate_all_ratings
  end

  def winner_and_loser_should_be_different
    return unless winner && loser

    if winner == loser
      errors.add(:loser_id, 'は勝者と異なるアカウントに設定してください')
    end
  end
end
