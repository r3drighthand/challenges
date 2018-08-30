require_relative '../anagrams'

describe 'anagrams?' do
  a = "lemon"
  b = "melon"
  c = "potato"
  d = "tomato"

  it 'returns true if words are anagrams' do
    expect(anagrams?(a, b)).to be true
  end

  it 'returns false if words are not anagrams' do
    expect(anagrams?(c, d)).to be false
  end

end