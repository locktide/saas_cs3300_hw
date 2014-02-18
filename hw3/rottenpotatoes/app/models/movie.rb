class Movie < ActiveRecord::Base

#catagory of all types of movie ratings, also will link for check box options
	def self.all_ratings
    	%w(G PG PG-13 R)
  	end
end
