require_relative 'die'
require_relative 'ruby_racer'
require_relative 'reset_screen'

players = [:a, :b]
player_1 = players[0]
player_2 = players[1]
die = Die.new
game = RubyRacer.new(players, die)

reset_screen
puts game.board_visualization
sleep(1)

until game.finished?
  game.players.each do |player|
    game.advance_player(player)
  end

  reset_screen
  puts game.board_visualization
  sleep(0.2)
end

puts "Player '#{game.winner}' wins!"
