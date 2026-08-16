class UserMoviesController < ApplicationController
  def update
    @current_user = User.first
    @movie = Movie.find(params[:movie_id])

    if params[:viewed] == "true"
      @current_user.watch!(@movie)
    else
      @current_user.unwatch!(@movie)
    end

    @user_movie = @current_user.user_movies.find_by(movie: @movie)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end
end
