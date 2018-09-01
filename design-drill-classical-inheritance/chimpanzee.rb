require_relative 'primate'

class Chimpanzee < Primate
  attr_reader :social, :tails
  include SuperPowers

  def initialize
    super
    @social = true
    @tails = false
  end
end
