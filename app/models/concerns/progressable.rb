module Progressable
  def total_movies
    Movie.count
  end

  def viewed_movies
    user_movies.where(viewed: true).count
  end

  def percentage
    return 0 if total_movies.zero?

    (viewed_movies.to_f / total_movies * 100).round
  end
end
