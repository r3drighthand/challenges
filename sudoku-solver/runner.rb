require_relative 'sudoku'

board_string = File.readlines('sudoku_puzzles.txt').first.chomp

solved_board = solve(board_string)
if solved?(solved_board)
  puts "The board was solved!"
  puts pretty_board(solved_board)
else
  puts "The board wasn't solved :("
end
