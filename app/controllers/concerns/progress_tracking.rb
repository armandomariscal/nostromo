module ProgressTracking
  extend ActiveSupport::Concern

  private

  def set_progress
    @total_movies = @current_user.total_movies
    @viewed_movies = @current_user.viewed_movies
    @progress_percentage = @current_user.progress_percentage
  end
end
