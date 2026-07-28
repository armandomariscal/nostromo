class Movie < ApplicationRecord
    has_many :user_movies, dependent: :destroy 
    has_many :users, through: :user_movies
end
