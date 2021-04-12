require 'rails_helper'

RSpec.describe 'Studios  show ' do
  before(:each) do
    @warnerbros = Studio.create(name: "Warner Bros", location: 'Hollywood')
    @paramountpics = Studio.create(name: 'Paramount Pictures', location: 'New York')
    @harrypotter = @warnerbros.movies.create(title: 'Harry Potter and the Phiosophiers Stone', creation_year: 2001, genre: 'Fantasy')
    @ww = @warnerbros.movies.create(title: 'Wonder Woman 1984', creation_year: 2020, genre: 'Superhero/Action')
    @godfather = @paramountpics.movies.create(title: 'The Godfather', creation_year: 1972, genre: 'Drama')
    
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
end
