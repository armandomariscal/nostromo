class User < ApplicationRecord
  include Progressable

  has_many :user_movies, dependent: :destroy
  has_many :movies, through: :user_movies
  has_many :reviews

  def watched?(movie)
    user_movies.exists?(movie: movie, viewed: true)
  end

  def watch!(movie)
    user_movies.find_or_create_by!(movie: movie).update!(viewed: true)
  end

  def unwatch!(movie)
    user_movies.find_by(movie: movie)&.update!(viewed: false)
  end

  def reviewed?(movie)
    reviews.exists?(movie: movie)
  end
end
