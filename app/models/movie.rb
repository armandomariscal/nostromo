class Movie < ApplicationRecord
  has_many :user_movies, dependent: :destroy
  has_many :users, through: :user_movies
  has_many :reviews

  def average_rating
    reviews.average(:rating)&.round(1)
  end

  def reviewed?
    reviews.exists?
  end

  def highly_rated?
    average_rating.present? && average_rating >= 4
  end

  def latest_review
    reviews.order(created_at: :desc).first
  end
end
