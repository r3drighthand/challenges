module CardView

  def self.ask_question(card)
    $stdout.print card.question
  end

  def self.get_user_answer
    $stdin.gets.chomp
  end

end