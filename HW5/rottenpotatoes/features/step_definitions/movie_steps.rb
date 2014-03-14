Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create(movie)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  #flunk "Unimplemented"
end

#This will help suffice the first cucumber test...
Then (/^the director of "(.*?)" should be "(.*?)"$/) do |movie, director|
	tested_movie = Movie.find_by_title movie
	tested_movie.director.should == director
end
