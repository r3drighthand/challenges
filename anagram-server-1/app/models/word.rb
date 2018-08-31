class Word < ApplicationRecord
  validates :phrase, presence: true

  def anagrams
    Word.all.select do |word_to_check|
      WordChecker.check_if_words_are_anagrams?(word_to_check, self)
  end
end