class UserMoviesController < ApplicationController
  def update
    @current_user = User.first

    @movie = Movie.find(params[:movie_id])

    @user_movie = UserMovie.find_or_create_by!(
      user: @current_user,
      movie: @movie
    )

    @user_movie.update!(
      viewed: params[:viewed]
    )

    @total_movies = Movie.count
    @viewed_movies = @current_user.user_movies.where(viewed: true).count
    @progress_percentage = (@viewed_movies.to_f / @total_movies * 100).round

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end
end