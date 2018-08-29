def convert_word_to_pig_latin(word)
  vowels = ["a", "e", "i", "o", "u"]
  if vowels.include?(word[0])
    return word
  else
    word_array = word.chars
    pig_latin_word = word_array.rotate.join + "ay"
  end
  pig_latin_word
end

def convert_sentence_to_pig_latin(phrase)
  pig_latin_phrase = []
  phrase_array = phrase.split(' ')
  phrase_array.each do |word|
    pig_latin_phrase << convert_word_to_pig_latin(word) + " "
  end
  pig_latin_phrase.join.chop
end