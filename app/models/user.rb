class User < ActiveRecord::Base
  has_many :winned_duels, class_name: 'Duel', foreign_key: :winner_id
  has_many :losed_duels, class_name: 'Duel', foreign_key: :losed_id

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
end
