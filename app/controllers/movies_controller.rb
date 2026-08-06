class MoviesController < ApplicationController
  def index
    @current_user = User.first
    @movies = Movie.includes(:user_movies).order(:year)

    @total_movies = @movies.count

    @viewed_movies = @current_user.user_movies
                                .where(viewed: true)
                                .count

    @progress_percentage =
      (@viewed_movies.to_f / @total_movies * 100).round
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
