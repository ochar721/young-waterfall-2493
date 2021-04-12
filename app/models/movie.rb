class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_credits
  has_many :actors, through: :movie_credits
end
