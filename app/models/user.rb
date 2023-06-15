class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_articles, through: :favorites, source: :article
  has_one_attached :image

  has_many :active_follows, class_name: "Follow", foreign_key: :following_id, dependent: :destroy
  has_many :followings, through: :active_follows, source: :follower
  has_many :passive_follows, class_name: "Follow", foreign_key: :follower_id, dependent: :destroy
  has_many :followers, through: :passive_follows, source: :following

  def followed_by?(user)
    follower =  passive_follows.find_by(following_id: user.id)
    return follower.present?
  end

  def favorite(article)
    favorite_articles << article
  end

  def unfavorite(article)
    favorite_articles.destroy(article)
  end

  def favorite?(article)
    favorite_articles.include?(article)
  end

  def own?(object)
    id == object.user_id
  end


  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :nickname, presence: true
  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
