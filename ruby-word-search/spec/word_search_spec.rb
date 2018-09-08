require_relative '../word_search'

describe 'straight_line_include?' do
  let(:puzzle) { [
  ["a", "w", "o", "l", "v", "e", "s"],
  ["s", "o", "a", "w", "a", "h", "p"],
  ["i", "t", "c", "k", "e", "t", "n"],
  ["o", "t", "s", "d", "h", "o", "h"],
  ["s", "e", "h", "g", "s", "t", "a"],
  ["u", "r", "p", "i", "w", "e", "u"],
  ["z", "s", "b", "n", "u", "i", "r"]
] }

  it "check to see if horizontal forward" do
    expect(straight_line_include?("wolves",puzzle)).to be true
  end
  it "check to see if horizontal forward" do
    expect(straight_line_include?("apple",puzzle)).to be false
  end

  it "check to see if horizontal backward" do
    expect(straight_line_include?("phaw",puzzle)).to be true
  end
  it "check to see if horizontal backward" do
    expect(straight_line_include?("wash",puzzle)).to be false
  end
end

describe 'snaking_include?' do
end

