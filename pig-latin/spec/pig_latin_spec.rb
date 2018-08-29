require_relative('../pig_latin')

describe 'Converting single words to Pig Latin' do
  it 'returns word unmodified if first letter is a vowel' do
    expect(convert_word_to_pig_latin("alligator")).to match("alligator")
  end

  it 'returns new word if word begins with consonant' do
    expect(convert_word_to_pig_latin("pig")).to match("igpay")
  end
end

describe 'Converting a sentence to Pig Latin' do
  it 'returns a new phrase with modified words only id they do not begin with vowels' do
    expect(convert_sentence_to_pig_latin("holding a wolf by the ear")). to match("oldinghay a olfway ybay hetay ear")
  end
