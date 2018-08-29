
def solve(board_string)
  original_string = board_string.dup
  board_array = process_string(board_string)
  board_array = board_array.unshift('covfefe')
  array_unsolved = id_unsolved_cells(board_array)
  return original_string if array_unsolved == []
  board_array = board_array.each_with_index.map do |cell, i|
    if cell == 0 || cell.is_a?(Array)
      solve_cell(i, board_array)
    else
      cell
    end
  end
  next_string = prepare_string(board_array)[7..-1]
  if original_string == next_string
    return next_string
  else
    solve(next_string)
  end
end

def id_unsolved_cells(board)
  board.each_index.select { |i| board[i] == 0 || board[i].is_a?(Array)}
end

def solve_cell(cell, board_array)
  rows = split_rows(board_array)
  columns = split_columns(rows)
  boxes = split_boxes(board_array)
  num_cell_row = id_cell_row(cell)
  num_cell_col = id_cell_col(cell)
  num_cell_box = id_cell_box(num_cell_row, num_cell_col)
  cell_row = get_cell_row(rows,num_cell_row)
  cell_col = get_cell_col(columns, num_cell_col)
  cell_box = get_cell_box(boxes, num_cell_box)
  imp = impossible_cell_values(cell_row, cell_col, cell_box)
  poss = possible_cell_values(imp)
  if poss.length == 1
    return poss[0]
  else
    return poss
  end
end

def split_rows(board)
  start_row = 1
  end_row = 9
  rows = []
  while end_row <= 81
    rows << board[start_row..end_row]
    start_row += 9
    end_row += 9
  end
  rows
end

def split_columns(rows)
  columns = rows.transpose
end

def split_boxes(board)
  box1 = board[1..3] +board [10..12] + board[19..21]
  box2 = board[4..6] +board [13..15] + board[22..24]
  box3 = board[7..9] +board [16..18] + board[25..27]
  box4 = board[28..30] +board[37..39] + board[46..48]
  box5 = board[31..33] +board [40..42] + board[49..51]
  box6 = board[34..36] +board [43..45] + board[52..54]
  box7 = board[55..57] +board [64..66] + board[73..75]
  box8 = board[58..60] +board [67..69] + board[76..78]
  box9 = board[61..63] +board [70..72] + board[79..81]
  boxes =[]
  boxes << box1
  boxes << box2
  boxes << box3
  boxes << box4
  boxes << box5
  boxes << box6
  boxes << box7
  boxes << box8
  boxes << box9

  return boxes
end

def id_cell_row(id)
  if id == 81
    row = (id/9)
  else
    row = (id / 9) + 1
  end
end

def id_cell_col(id)
  if id == 0
    col = 1
  else
    col = id % 9
  end

  if col == 0
    col = 9
  end
  return col
end

def id_cell_box(row, col)
  if row <= 3 && col <= 3
    box = 1
  elsif row <= 3 && col >= 4 && col <= 6
    box = 2
  elsif row <= 3 && col >= 7 && col <= 9
    box = 3
  elsif row >= 4 && row <= 6 && col <= 3
    box = 4
  elsif row >= 4 && row <= 6 && col >= 4 && col <= 6
    box = 5
  elsif row >= 4 && row <= 6 && col >= 7
    box = 6
  elsif row >= 7 && col <= 3
    box = 7
  elsif row >= 7 && col >= 4 && col <= 6
    box = 8
  elsif row >= 7 && col >= 7
    box = 9
  end
  return box
end

def get_cell_row(rows, num_cell_row)
  cell_row = rows[num_cell_row-1]
end

def get_cell_col(cols, num_cell_col)
  cell_col = cols[num_cell_col-1]
end

def get_cell_box(boxes, num_cell_box)
  cell_box = boxes[num_cell_box-1]
end

def process_string(string)
  array = Array.new
  while string.length > 0
    if string.chars[0] == "["
      array << string
      .slice!(0..(string.index(/\]/)))[1..-2]
      .split("")
      .map(&:to_i)
    else
      array << string.slice!(0).to_i
    end
  end
  array
end

def prepare_string(array)
  array.map do |a|
    if a == 0
      "-"
    elsif a.is_a? Array
      "[#{a.map(&:to_s).join}]"
    else
      a.to_s
    end
  end.join
end

def impossible_cell_values(cell_row, cell_col, cell_box)
  impossible_values = cell_row + cell_col + cell_box
  # p impossible_values.uniq
end

def possible_cell_values(impossible_cell_values)
  possible_cell_values = [*1..9] - impossible_cell_values
end

# Returns a boolean indicating whether
# or not the provided board is solved.
# The input board will be in whatever
# form `solve` returns.

def pretty_board(board)
end
