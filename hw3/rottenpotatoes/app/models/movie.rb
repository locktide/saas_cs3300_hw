class Movie < ActiveRecord::Base
=begin	
	def Movie.get_all_ratings
		all_ratings = []
		self.select(:rating).group(:rating).each do |movie|
			all_ratings << movie.rating
		end
		return all_ratings
	end
=end
	def self.all_ratings
    	%w(G PG PG-13 NC-17 R)
  	end
end
