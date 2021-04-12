class Actor < ApplicationRecord
  has_many :movie_credits
  has_many :movies, through: :mechanic_ride
end
