class GuessingGame
  attr_reader :answer
  attr_accessor :solved

  def initialize(answer)
    @answer = answer
    @solved = false
    @valid_numbers = (1..100).to_a
    raise "Answer must be between 1 and 100" unless @valid_numbers.include? answer
  end

  def guess(number)
    if number == answer
      self.solved = true
      :correct
    elsif (number > answer)
      self.solved = false
      :high
    elsif (number < answer)
      self.solved = false
      :low
    end
  end

  def solved?
    self.solved
  end
end
