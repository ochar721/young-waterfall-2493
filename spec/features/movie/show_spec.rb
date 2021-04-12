require 'rails_helper'

RSpec.describe 'Movies show ' do
  before(:each) do
    @warnerbros = Studio.create(name: "Warner Bros", location: 'Hollywood')

    @harrypotter = @warnerbros.movies.create(title: 'Harry Potter and the Phiosophiers Stone', creation_year: 2001, genre: 'Fantasy')
    @ww = @warnerbros.movies.create(title: 'Wonder Woman 1984', creation_year: 2020, genre: 'Superhero/Action')
    @daniel = Actor.create(name: 'Daniel Ratcliffe',age: 30, currently_working: true)
    @alan = Actor.create(name: 'Alan Rickmane',age: 60, currently_working: false)
    @rupert = Actor.create(name: 'Rupert Grint',age: 32, currently_working: true)

    visit "/movies/#{@harrypotter.id}"
  end

  it "shows the movie attributes" do
    expect(page).to have_content(@harrypotter.title)
    expect(page).to have_content(@harrypotter.creation_year)
    expect(page).to have_content(@harrypotter.genere)
    expect(page).to_not have_content(@ww.title)
  end

  it "shows the actores in the movie" do
    expect(page).to have_content(@daniel.name)
    expect(page).to have_content(@alan.name)
    expect(page).to have_content(@rupert.name)
  end
end
