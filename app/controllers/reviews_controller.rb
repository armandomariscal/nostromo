class ReviewsController < ApplicationController
  before_action :set_current_user
  before_action :set_movie
  before_action :set_progress, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = @movie.reviews.build(review_params)
    @review.user = @current_user

    if @review.save
      redirect_to movie_path(@movie), notice: "Review created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_current_user
    @current_user = User.first
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
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

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end