require_relative 'animal'

class Amphibian < Animal
  attr_reader :oviparous, :aquatic
  include SuperPowers

  def initialize
    super
    @oviparous = true
    @aquatic = true
  end
end
