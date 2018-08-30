require_relative 'die'
require_relative 'ruby_racer'
require_relative 'reset_screen'

players = [:a, :b]
player_1 = players[0]
player_2 = players[1]
die = Die.new
game = RubyRacer.new(players, die)