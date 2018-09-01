require_relative 'mammal'

class Primate < Mammal
  attr_reader :num_legs, :arboreal

  def initialize
    super
    @num_legs = 2
    @arboreal = true
  end
end
