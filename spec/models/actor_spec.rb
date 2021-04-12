require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it {should have_many(:movie_credits)}
    it {should have_many(:movies).through(:movie_credits)}
  end
end
