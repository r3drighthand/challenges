
def word_sorter(possible_anagram)
  possible_anagram.downcase.chars.sort.join
end

def detect_anagram?(possible_anagram, target_word)
  sorted_possible_anagram = word_sorter(possible_anagram)
  sorted_target = word_sorter(target_word)
  sorted_possible_anagram.include?(sorted_target)
end

def find_anagrams(target_word, possible_anagrams)
  possible_anagrams.select do |word|
    detect_anagram?(word, target_word)
  end
end

