class Actor < ApplicationRecord
  has_many :movie_credits
  has_many :movies, through: :movie_credits
end
