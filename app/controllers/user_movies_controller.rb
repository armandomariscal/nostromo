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

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end
end