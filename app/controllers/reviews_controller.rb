class ReviewsController < ApplicationController
  include ProgressTracking

  before_action :set_current_user
  before_action :set_movie
  before_action :set_progress, only: %i[new create]

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

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
