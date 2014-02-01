module FunWithStrings
  def count_words
=begin   
words = self.gsub!(/(\w|\s)/).to_s.split(' ')
    #words = words.map!{ |word| word.gsub(/\W/).to_s}
    puts words.class
		hash_temp = Hash.new(0)
		words.each { |word| hash_temp[word.downcase] +=1 }
    return hash_temp
=end  

    words = self.gsub(/(\W)/, " ").to_s.strip.split(" ")
    #puts words.to_s
    #words.each {|word| [word.gsub(/\W/)]}
    #puts words.to_s
		hash_temp = Hash.new(0)
		words.each { |word| hash_temp[word.downcase] +=1 }
    return hash_temp
  end
  
  def anagram_groups 
    anagrams={}
    words = self.split(" ")
    words.each do |word|
      anagrams[word.downcase.split('').sort.join] ||=[]
      anagrams[word.downcase.split('').sort.join] << word 
    end
    anagrams.values
  end
    
end

class String 
  include FunWithStrings
  
end
  
#puts "A man, a plan, a canal -- Panama!".count_words
puts "x".anagram_groups






