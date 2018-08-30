require_relative '../find_anagrams'

describe 'find_anagrams' do
  it 'returns any anagrams from the provided list' do
    possible_anagrams = ['block', 'caret', 'react', 'trace', 'box']
    found_anagrams    = find_anagrams('crate', possible_anagrams)

    expect(found_anagrams).to match_array ['caret', 'react', 'trace']
  end
end

describe 'anagrams?' do
  it 'checks whether anagram is anagram' do
    expect(detect_anagram?("melon", "lemon")).to eq true
  end

  it 'is not case sensitive' do
    expect(detect_anagram?("Mean", "name")).to eq true
  end

  it 'checks whether target word is not an anagram' do
    expect(detect_anagram?("melon", "cactus")).to eq false
  end

  it 'returns true if both words are identical' do
    expect(detect_anagram?("crocodile", "crocodile")).to eq true
  end

  it 'works with non-letter characters' do
    expect(detect_anagram?("the-eyes", "they-see")).to eq true
  end

  it 'checks for method flaws' do
    expect(detect_anagram?("shell", "she")).to eq false
  end
end
