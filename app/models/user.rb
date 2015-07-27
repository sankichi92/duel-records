class User < ActiveRecord::Base
  has_many :winned_duels, class_name: 'Duel', foreign_key: :winner_id, dependent: :nullify
  has_many :losed_duels, class_name: 'Duel', foreign_key: :loser_id, dependent: :nullify

  def played_duels
    Duel.where(['winner_id = ? or loser_id = ?', id, id]).order('date DESC')
  end

  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]
    image_url = auth_hash[:info][:image]

    User.find_or_create_by(provider: provider, uid: uid) do |user|
      user.nickname = nickname
      user.image_url = image_url
    end
  end

  private

  def self.calculate_all_ratings
    users = Hash.new(1500)
    Duel.order('date, created_at').each do |d|
      e = 1.0 / (10**((users[d.loser_id] - users[d.winner_id]) / 1000.0) + 1)
      users[d.winner_id] += 16 * (3 - e)
      users[d.loser_id] += 16 * (0 - (1 - e))
    end
    update_all(rating: 1500)
    users.each do |id, rating|
      find(id).update_attribute(:rating, rating.to_i)
    end
  end
end
