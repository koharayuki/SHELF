class Article < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :title, :text,  presence: true
  validates :genre_id, numericality: { other_than: 1 , message: "を選択してください"}
end
