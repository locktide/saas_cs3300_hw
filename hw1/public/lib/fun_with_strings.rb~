module FunWithStrings
  def palindrome?
    # your code here
		if self == nil then return false end
    temp = self.downcase
		temp = temp.gsub(/(\W|\d)/, "")
		temp == temp.reverse   
  end
  
  def count_words
    #it was crucial to have the replace inside of gsub cuz it continues
    #to change the object from a string to a enumerator!!!!! took for ever to figz
		words = self.gsub(/(\W)/, " ").to_s.strip.split(" ")
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

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
