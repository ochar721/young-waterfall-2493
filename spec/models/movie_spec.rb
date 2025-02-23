require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many(:movie_credits)}
    it {should have_many(:actors).through(:movie_credits)}
  end
end
