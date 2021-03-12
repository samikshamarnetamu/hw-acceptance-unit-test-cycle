require 'rails_helper'


RSpec.describe MoviesHelper, type: :helper do

  describe 'helper methods' do
    it 'should return odd' do
      response = oddness 1

      expect(response).to eq("odd")
    end
  end

  describe 'helper methods' do
    it 'should return even' do
      response = oddness 12
      expect(response).to eq("even")
    end
  end

end 