class MoviesController < ApplicationController
  def index
  @current_user = User.first
  @movies = Movie.includes(:user_movies).order(:year)
end
end
