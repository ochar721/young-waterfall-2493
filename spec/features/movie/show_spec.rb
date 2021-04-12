require 'rails_helper'

RSpec.describe 'Movies show ' do
  before(:each) do
    @warnerbros = Studio.create(name: "Warner Bros", location: 'Hollywood')

    @harrypotter = @warnerbros.movies.create(title: 'Harry Potter and the Philosophers Stone', creation_year: 2001, genre: 'Fantasy')
    @ww = @warnerbros.movies.create(title: 'Wonder Woman 1984', creation_year: 2020, genre: 'Superhero/Action')
    @daniel = Actor.create(name: 'Daniel Ratcliffe',age: 30, currently_working: true)
    @alan = Actor.create(name: 'Alan Rickmane',age: 60, currently_working: false)
    @rupert = Actor.create(name: 'Rupert Grint',age: 32, currently_working: true)
    @gal = Actor.create(name: 'Gal Gadot',age: 44, currently_working: true)

    MovieCredit.create(actor_id: @daniel.id, movie_id: @harrypotter.id)
    MovieCredit.create(actor_id: @alan.id, movie_id: @harrypotter.id)
    MovieCredit.create(actor_id: @rupert.id, movie_id: @harrypotter.id)
    MovieCredit.create(actor_id: @gal.id, movie_id: @ww.id)

    visit "/movies/#{@harrypotter.id}"
  end

  it "shows the movie attributes" do
    expect(page).to have_content(@harrypotter.title)
    expect(page).to have_content(@harrypotter.creation_year)
    expect(page).to have_content(@harrypotter.genre)
    expect(page).to_not have_content(@ww.title)
  end

  it "shows the actores in the movie" do

    expect(page).to have_content(@daniel.name)
    expect(page).to have_content(@alan.name)
    expect(page).to have_content(@rupert.name)
    expect(page).to_not have_content(@gal.name)
  end
end
