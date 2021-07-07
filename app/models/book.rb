class Book < ApplicationRecord

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  validates :category, presence: true

  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  scope :latest, -> {order(updated_at: :desc)}
  scope :fresh, -> {order(evaluation: :desc)}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.looks(searches, words)
    where("category LIKE?","%#{words}%")
  end

end
