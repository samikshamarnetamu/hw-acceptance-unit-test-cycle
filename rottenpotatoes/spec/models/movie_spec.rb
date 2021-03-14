require 'rails_helper'
require 'extra'
require 'simplecov'
SimpleCov.start 'rails'
require 'database_cleaner'

# DatabaseCleaner.strategy = :truncation

# # then, whenever you need to clean the DB
# DatabaseCleaner.clean

RSpec.describe Movie, type: :model do
    it "returns similar movies" do
        movie_1 = Movie.create(title: 'movie_11', director: 'director11')
        movie_2 = Movie.create(title: 'movie_22', director: 'director11')
        movie_3 = Movie.create(title: 'movie_33', director: 'director22')
        expect(movie_1.movies_by_same_director('director11')) == [movie_1, movie_2]
        expect(movie_1.movies_by_same_director('director11')) != [movie_1, movie_2, movie_3]
    end

end 