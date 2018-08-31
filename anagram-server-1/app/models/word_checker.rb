module WordChecker
  def self.check_if_words_are_anagrams?(word_in_db, input_word)
    word_in_db.phrase.downcase.chars.sort.join == input_word.phrase.downcase.chars.sort.join
  end
end