class Movie < ActiveRecord::Base
    def movies_by_same_director(director)
        return nil if director.blank? or director.nil?
        Movie.where(director: director)
    
    end
    
    def self.all_ratings
    %w(G PG PG-13 NC-17 R)
    end
end
