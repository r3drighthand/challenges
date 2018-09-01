require_relative 'fruit_tree'

class AppleTree < FruitTree
  class NoApplesError < StandardError
  end

  MAXIMUM_AGE = 45
  MAXIMUM_HEIGHT = 26
  MATURE_AGE = 5
  ANNUAL_GROWTH = 2
  YEAR = 1

  attr_accessor :apples

  def initialize
    super
    @apples = []
  end

  def pass_growing_season
    self.apples.clear
    self.age += YEAR
    if height < MAXIMUM_HEIGHT
      self.height += ANNUAL_GROWTH
    end
    if mature?
      self.apples = Array.new(rand(400..600)) { Apple.new }
    end
  end

  def mature?
    age >= MATURE_AGE
  end

  def dead?
    age >= MAXIMUM_AGE
  end

  def has_apples?
    apples.length > 0
  end

  def pick_an_apple
    raise NoApplesError, "This tree has no apples" unless self.has_apples?

    self.apples.pop
  end
end
