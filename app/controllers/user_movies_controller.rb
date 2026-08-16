class UserMoviesController < ApplicationController
  def update
    @current_user = User.first
    @movie = Movie.find(params[:movie_id])

    @user_movie = @current_user.user_movies.find_or_create_by!(
      movie: @movie
    )

    @user_movie.update!(
      viewed: params[:viewed]
    )

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end
end
