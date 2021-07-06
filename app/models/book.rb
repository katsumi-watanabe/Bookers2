class Book < ApplicationRecord

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  scope :latest, -> {order(updated_at: :desc)}
  scope :fresh, -> {order(evaluation: :desc)}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.looks(searches, words)
    if searches == "forward_match"
      @books = Book.where("title LIKE ?", "#{words}%")
    elsif searches == "backward_match"
      @books = Book.where("title LIKE ?", "%#{words}")
    elsif searches == "perfect_match"
      @books = Book.where(title: words)
    elsif searches == "partial_match"
      @books = Book.where("title LIKE?","%#{words}%")
    else
      @books = Book.all
    end
  end

end
