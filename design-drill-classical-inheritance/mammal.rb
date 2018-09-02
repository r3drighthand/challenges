require_relative 'animal'

class Mammal < Animal
  attr_reader :fur, :viviparous, :warmblooded

  def initialize
    super
    @fur = true
    @vivparous = true
    @warmblooded = true
  end

end
