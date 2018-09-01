require_relative 'fruit_tree'

class PearTree < FruitTree
  class NoPearsError < StandardError
  end

  MAXIMUM_AGE = 40
  MAXIMUM_HEIGHT = 20
  MATURE_AGE = 5
  ANNUAL_GROWTH = 2.5
  YEAR = 1

  attr_accessor :pears

  def initialize
    super
    @pears = []
  end

  def pass_growing_season
    self.pears.clear
    self.age += YEAR
    if height < MAXIMUM_HEIGHT
      self.height += ANNUAL_GROWTH
    end
    if mature?
      self.pears = Array.new(rand(100..300)) { Pear.new }
    end
  end

  def mature?
    age >= MATURE_AGE
  end

  def dead?
    age >= MAXIMUM_AGE
  end

  def has_pears?
    pears.length > 0
  end

  def pick_a_pear
    raise NoPearsError, "This tree has no pears" unless self.has_pears?

    self.pears.pop
  end
end




