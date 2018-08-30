
def anagrams?(a, b)
  word_match(a) == word_match(b)
end

def word_match(word)
  sorted_word = word.downcase.chars.sort
end
