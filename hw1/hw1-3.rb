#Feel free to optimize! - JDR

def combine_anagrams(sourceArray)
  alphabeticArray = Array.new
  resultArray = Array.new
  sourceArray.each do |item|
    alphabeticString = item.downcase.chars.sort.join
    if !alphabeticArray.include?(alphabeticString)
      alphabeticArray<<alphabeticString
      arrayOfWords = Array.new
      arrayOfWords << item
      resultArray << arrayOfWords
    else
      designatedIndex = alphabeticArray.index(alphabeticString)
      resultArray[designatedIndex] << item
    end
  end
  resultArray
end

# EXPLANATION
# 
# NOTE: please heed the given hint: "you can quickly tell if two words are anagrams by sorting their letters"
# 
# The idea here is to keep track of two arrays (in addition to the source array).  One array, alphabeticArray, holds the words whose letters have been rearranged alphabetically ( e.g., "cars" is stored as "acrs"), and 
# the second array, resultArray, holds the array of arrays with the anagrams grouped together.  The INDEX of
# the alphabeticArray and resultArray correspond to the the same anagrams.  So, for example, the first element (index of 0) in alphabeticArray holds "acrs" while the first element in resultArray holds all the anagrams
# that correspond to the rearranged letters "acrs" -- ["cars", "racs", "scar"].  
# 
# The procedure goes as such:
# At each iteration through the sourceArray:
# 1) Rearrange the letters (alphabeticString = item.downcase.chars.sort.join)
# 2) Test if the alphabeticString is in the alphabeticArray.  If not:
#     a) Push this string onto the alphabeticArray
#     b) Make a new array, push the current string onto this array, then push this array onto the results array
# 3) Otherwise, we already have the alphabeticString for the current word, and we simply need to add
#   the current word to the results array.
#    a) Find the correct index for the result array, and push the current word onto this index.  This adds
#   it to the correct array
# 4) Fin.  I put resultArray on the last line so that it is returned and I can print.

# Test Code
# theArr = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
# p combine_anagrams(theArr)