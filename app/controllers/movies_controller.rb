class MoviesController < ApplicationController
  before_action :set_current_user
  before_action :set_movie, only: :show
  before_action :set_progress

  def index
    @movies = Movie.includes(:user_movies).order(:year)
  end

  def show
  end

  private

  def set_current_user
    @current_user = User.first
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def set_progress
    @total_movies = Movie.count

    @viewed_movies = @current_user.user_movies
                                  .where(viewed: true)
                                  .count

    @progress_percentage =
      if @total_movies.zero?
        0
      else
        (@viewed_movies.to_f / @total_movies * 100).round
      end
  end
end
