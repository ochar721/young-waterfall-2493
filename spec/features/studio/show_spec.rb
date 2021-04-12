require 'rails_helper'

RSpec.describe 'Studios  show ' do
  before(:each) do
    @warnerbros = Studio.create(name: "Warner Bros", location: 'Hollywood')
    @paramountpics = Studio.create(name: 'Paramount Pictures', location: 'New York')
    @harrypotter = @warnerbros.movies.create(title: 'Harry Potter and the Phiosophiers Stone', creation_year: 2001, genre: 'Fantasy')
    @ww = @warnerbros.movies.create(title: 'Wonder Woman 1984', creation_year: 2020, genre: 'Superhero/Action')
    @wonderwoman = @warnerbros.movies.create(title: 'Wonder Woman', creation_year: 2017, genre: 'Superhero/Action')
    @godfather = @paramountpics.movies.create(title: 'The Godfather', creation_year: 1972, genre: 'Drama')

    @daniel = Actor.create(name: 'Daniel Ratcliffe',age: 30, currently_working: true)
    @alan = Actor.create(name: 'Alan Rickman',age: 60, currently_working: false)
    @rupert = Actor.create(name: 'Rupert Grint',age: 32, currently_working: true)
    @gal = Actor.create(name: 'Gal Gadot',age: 44, currently_working: true)
    @al = Actor.create(name: 'Al Pacino',age: 70, currently_working: true)

    MovieCredit.create(actor_id: @daniel.id, movie_id: @harrypotter.id)
    MovieCredit.create(actor_id: @alan.id, movie_id: @harrypotter.id)
    MovieCredit.create(actor_id: @rupert.id, movie_id: @harrypotter.id)
    MovieCredit.create(actor_id: @gal.id, movie_id: @ww.id)
    MovieCredit.create(actor_id: @gal.id, movie_id: @wonderwoman.id)
    MovieCredit.create(actor_id: @al.id, movie_id: @godfather.id)

    visit "/studios/#{@warnerbros.id}"
  end

  it "I seee the studios name and location" do

    expect(page).to have_content(@warnerbros.name)
    expect(page).to have_content(@warnerbros.location)
    expect(page).to_not have_content(@paramountpics.name)
    expect(page).to_not have_content(@paramountpics.location)
  end

  it "I see the list of all the titles of its movies" do
    expect(page).to have_content(@harrypotter.title)
    expect(page).to have_content(@ww.title)
    expect(page).to_not have_content(@godfather.title)
  end

  it "shows list of actors that acted in the studios movies unique actors only, they ordered from oldest to youngest, list of actors currently working" do
    expect(page.all('.actor')[0]).to have_content(@al.name)
    expect(page.all('.actor')[1]).to have_content(@gal.name)
    expect(page.all('.actor')[2]).to have_content(@rupert.name)
    expect(page.all('.actor')[3]).to have_content(@daniel.name)
  end

end
