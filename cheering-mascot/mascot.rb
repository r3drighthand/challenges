def call_out_cheer
  puts "What is your cheer?"
  input = gets.chomp
end


def mascot_sign_for(input)
  case input
  when input = "RED HOT"
    "H-O-T!"
  when input = "DO IT AGAIN"
    "Go, Fight, Win"
  when input = "2 BITS"
    "Holler!"
  when input = "STOMP YOUR FEET"
    "STOMP!"
  else
    "Go Team!"
  end
end


def display(response)
  p response
end


def coordinate_cheers
  gameover = false
  no_cheers = 0
  until gameover || no_cheers >= 2
    cheer = call_out_cheer
    if cheer == "GAME OVER"
      gameover = true
    elsif
      cheer == ""
      no_cheers += 1
    else
      display(mascot_sign_for(cheer))
    end
  end
end
