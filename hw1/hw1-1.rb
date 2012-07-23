def palindrome? (word)
  word.downcase.gsub(/\W/, "") == word.downcase.gsub(/\W/, "").reverse
end

# word.downcase returns a copy of word that is all lower case
# gsub returns a copy with the white space removed
#.reverse returns a copy with the characters reversed.   
# Finally the == tests for equality and returns a boolean.

def count_words(string)
  results = string.gsub(/[^a-zA-Z0-9 ]/,'').downcase.split().inject(Hash.new(0)) do |counts, word|
    counts[word] += 1
    counts
  end
end

#the .gsub regex replaces all non-alphanumeric characters with an empty string and returns a new copy
#downcase returns a copy of the string in all lower case
#split returns an array which, by default, is delimited by spaces and endoflines

#see http://blog.jayfields.com/2008/03/ruby-inject.html for inject.  Here's my explanation:

#Hash.new(0) instantiates a new hash for the first argument in the block, counts.  (i.e., counts = Hash.new(0) )
#As you can see, the default value for each hash key-value pair is set to zero
#The block simply adds +1 to a given key in the hash
#We make counts the last line in the block because the return value for the block is what gets passed into counts each iteration.