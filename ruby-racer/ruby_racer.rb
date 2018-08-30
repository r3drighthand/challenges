class RubyRacer
  attr_reader :players, :die, :length
  attr_accessor :player_1_position, :player_2_position

  BOARD_LENGTH = self.length

  def initialize(players, die, length=30)
    @players = players
    @die = die
    @length = length
    @player_1_position = 0
    @player_2_position = 0
  end

  def board_visualization
    new_array = Array.new(30, "|")
    player_1_display, player_2_display = new_array, new_array

    player_1_display[player_1_position] = "=a"
    puts player_1_display.join
    player_2_display[player_2_position] = "=b"
    puts player_1_display.join
  end

  def advance_player(player)
    if player == players[0]
      self.player_1_position += die.roll
    elsif player == player[1]
      self.player_2_position += die.roll
    end
  end

  def finished?
    player_1_position >= BOARD_LENGTH || player_2_position >= BOARD_LENGTH ? return true : return false
  end

  def winner
    if player_1_position >= BOARD_LENGTH
      return players[0]
    elsif player_2_position >= BOARD_LENGTH
      return players[1]
    else
      nil
    end
  end

end