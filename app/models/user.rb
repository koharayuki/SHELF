class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :active_follows, class_name: "Follow", foreign_key: :following_id, dependent: :destroy
  has_many :followings, through: :active_follows, source: :follower
  has_many :passive_follows, class_name: "Follow", foreign_key: :follower_id, dependent: :destroy
  has_many :followers, through: :passive_follows, source: :following

  def followed_by?(user)
    follower =  passive_follows.find_by(following_id: user.id)
    return follower.present?
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :nickname, presence: true

end
