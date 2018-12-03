def generate_tic_tac_toe
  s = Array.new(9) {["X","O"].sample};
  board= [
      [s[0], s[1], s[2]],
      [s[3], s[4], s[5]],
      [s[6], s[7], s[8]],
  ]

 num_os = check_num_os(board)
 new_board = edit_board(num_os, board)
 num_os = check_num_os(board)
 num_xs = 9 - num_os
 return new_board, num_os, num_xs
end

def check_num_os(board)
num_os = 0
  board.each do |row|
    row.each do |square|
      if square == "O"
        num_os += 1
      end
    end
  end
  return num_os
end

def edit_board(number,board)
  i =0
  while number > 4
    entry_to_change =board[i].index("O")
    board[i][entry_to_change] = "X"
    number -= 1
    i+=1
  end

  while number < 4
    entry_to_change = board[i].index("X")
    board[i][entry_to_change] = "O"
    number += 1
    i+=1
  end
  return board
end

generate_tic_tac_toe
