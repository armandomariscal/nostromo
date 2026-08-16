class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  delegate :title, :year, to: :movie, prefix: true

  validates :content, presence: true
  validates :rating, inclusion: { in: 1..10 }
end
