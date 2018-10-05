require_relative 'card'

module Parser

  def self.parse(filename)
    questions = []
    answers = []
    File.foreach(filename) do |row|
      if row.include?("?")
        questions << row.chomp
      elsif row != "\n"
        answers << row.chomp
      end
    end
    self.parse_cards(questions, answers)
  end

  def self.parse_cards(questions, answers)
    cards = []
    questions.each_index do |index|
      cards << Card.new({
        question: questions[index],
        answer: answers[index]
        })
    end
    cards
  end
end

