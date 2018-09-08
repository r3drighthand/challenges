require_relative 'word_search'

require_relative 'word_search'

puzzle = [
  ["a", "w", "o", "l", "v", "e", "s"],
  ["s", "o", "a", "w", "a", "h", "p"],
  ["i", "t", "c", "k", "e", "t", "n"],
  ["o", "t", "s", "d", "h", "o", "h"],
  ["s", "e", "h", "g", "s", "t", "a"],
  ["u", "r", "p", "i", "w", "e", "u"],
  ["z", "s", "b", "n", "u", "i", "r"]
]
 p "when wolves is on a horizontal row"
 p straight_line_include?("wolves", puzzle)
 p "when happy is not found in the puzzle"
 p straight_line_include?("happy", puzzle)
 p "reverse the word"
 p straight_line_include?("phaw", puzzle)

 p straight_line_include?("otters", puzzle)
 p straight_line_include?("asios", puzzle)
 p straight_line_include?("bison", puzzle)

 p "only edge for diagonal"
 p location = letter_on_edge("bison", puzzle)
 word = []
 p find_diagonal(word, puzzle, location["start_row"], location["start_index"])

p straight_line_include?("bison", puzzle)
