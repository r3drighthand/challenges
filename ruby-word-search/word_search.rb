def search_horizontal_forward(word, puzzle)
  word_length = word.chars.length
  puzzle.each do |row|
    if row.include? (word.chr)
      start = row.index(word.chr)
      word_found = row.slice(start, word_length).join
      if word_found == word
        return true
      end
    end
  end
  false
end

def search_horizontal_backward(word, puzzle)
  reverse_word = word.reverse
  word_length = reverse_word.chars.length
  puzzle.each do |row|
    if row.include? (reverse_word.chr)
      start = row.index(reverse_word.chr)
      word_found = row.slice(start, word_length).join
      if word_found == reverse_word
        return true
      end
    end
  end
  false
end
def get_columns(puzzle)
  vertical_puzzle = puzzle.transpose
end

def search_columns_downward(word, puzzle)
  column_puzzle = get_columns(puzzle)
  search_horizontal_forward(word, column_puzzle)
end

def search_columns_upward(word, puzzle)
  column_puzzle = get_columns(puzzle)
  search_horizontal_backward(word, column_puzzle)
end

def letter_on_edge(word,puzzle)
  location = {"start_row" => 0, "start_index" => 0 }
  if puzzle[0].include?(word.chr)
    p location["start_index"] = puzzle[0].index(word.chr)
    #start_row = 0
  elsif puzzle[-1].include?(word.chr)
    p location["start_index"] = puzzle[-1].index(word.chr)
    p location["start_row"] = puzzle.length - 1
  elsif puzzle.transpose[0].include?(word.chr)
    p location["start_row"] = puzzle.transpose[0].index(word.chr)

  elsif puzzle.transpose[-1].include?(word.chr)
    p location["start_row"] = puzzle.transpose[-1].index(word.chr)
  end
  p location
end

def find_diagonal(new_word, puzzle, start_row, start_index)
  new_word = new_word
    if (start_row < 0 )  || (start_index > 6)
      return new_word
    else
    new_word << puzzle[start_row][start_index]

    find_diagonal(new_word,puzzle,(start_row - 1), (start_index +1)  )
    end

end

def straight_line_include?(word, puzzle)
  # first search horizontally
  # get length of word
  # for each row check if the first letter of wrod is found
  # if found check and see if word is in the array
  if search_horizontal_forward(word, puzzle)
    return true
  elsif search_horizontal_backward(word, puzzle)
    return true
  elsif search_columns_downward(word, puzzle)
    return true
  elsif  search_columns_upward(word, puzzle)
    return true
  else
    location = letter_on_edge(word,puzzle)
    word_length = word.chars.length
    # if the absolute value of from index to end of row < length return false
    if word_length != (puzzle[location["start_row"]].length - location["start_index"]).abs
      return false
    else
      new_word = []
      word_array = find_diagonal(new_word,puzzle,location["start_row"], location["start_index"])
      # p word_array
      # p word_array.join
      if word_array.join == word
        return true
      end
    end
  end
  false
end
