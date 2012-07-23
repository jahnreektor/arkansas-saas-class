def palindrome? (word)
  word == word.downcase.gsub(/\W/, "").reverse
end

def count_words(string)
  results = string.gsub(/[^a-zA-Z0-9 ]/,'').downcase.split().inject(Hash.new(0)) do |counts, word|
    counts[word] += 1
    counts
  end
end