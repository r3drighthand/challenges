require_relative 'mammal'

class Bat < Mammal
  attr_reader :has_wings, :echolocation, :nocturnal
  include SuperPowers

  def initialize
    super
    @has_wings = true
    @echolocation = true
    @nocturnal = true
  end
end
