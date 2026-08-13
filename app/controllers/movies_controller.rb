require "json"

class MoviesController < ApplicationController
  before_action :set_current_user
  before_action :set_movie, only: :show
  before_action :set_user_movie, only: :show
  before_action :set_progress

  def index
    @movies = Movie.includes(:user_movies).order(:year)
  end

  def show
    movie_details = JSON.parse(
      File.read(Rails.root.join("tmp", "movie_details.json"))
    )

    details = movie_details[@movie.year.to_s] || {}

    @crew_members = details["crew_members"] || []
    @ships = details["ships"] || []
  end

  private

  def set_current_user
    @current_user = User.first
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def set_user_movie
    @user_movie = @current_user.user_movies.find_by(movie: @movie)
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
