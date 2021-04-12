class Studio < ApplicationRecord
  has_many :movies

  def self.actors_in_movies
    Movie.joins(:actors).where('actors.age DESC').uniq
  end

  # uniq actors using (uniq)
  #actors by olders to youngest (age: :desc)
  #actors that is only actors currently working(currently_working: true)

end
