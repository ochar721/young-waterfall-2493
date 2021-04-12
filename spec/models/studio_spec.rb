require 'rails_helper'

RSpec.describe Studio do
  describe 'relationships' do
    it {should have_many :movies}
  end


  describe 'shows all actors for any of the studios movies'do
  before(:each) do
    @warnerbros = Studio.create(name: "Warner Bros", location: 'Hollywood')

    @harrypotter = @warnerbros.movies.create(title: 'Harry Potter and the Philosophers Stone', creation_year: 2001, genre: 'Fantasy')
    @ww = @warnerbros.movies.create(title: 'Wonder Woman 1984', creation_year: 2020, genre: 'Superhero/Action')
    @wonderwoman = @warnerbros.movies.create(title: 'Wonder Woman', creation_year: 2017, genre: 'Superhero/Action')

    @daniel = Actor.create(name: 'Daniel Ratcliffe',age: 30, currently_working: true)
    @alan = Actor.create(name: 'Alan Rickman',age: 60, currently_working: false)
    @rupert = Actor.create(name: 'Rupert Grint',age: 32, currently_working: true)
    @gal = Actor.create(name: 'Gal Gadot',age: 44, currently_working: true)


    MovieCredit.create(actor_id: @daniel.id, movie_id: @harrypotter.id)
    MovieCredit.create(actor_id: @alan.id, movie_id: @harrypotter.id)
    MovieCredit.create(actor_id: @rupert.id, movie_id: @harrypotter.id)
    MovieCredit.create(actor_id: @gal.id, movie_id: @ww.id)
    MovieCredit.create(actor_id: @gal.id, movie_id: @wonderwoman.id)

  end

  it '.actors_in_movies' do
    expect(Studio.actors_in_movies).to eq([@gal,  @rupert, @daniel])
    end
  end
end


#
# And I see that the list of actors is unique (no duplicate actors)
# And I see that the list of actors is ordered from oldest actor to youngest
# And I see that the list of actors only includes actors that are currently working
