require_relative 'amphibian'

class Frog < Amphibian
  attr_reader :bulging_eyes, :webbed_feet

  def initialize
    super
    @bulging_eyes = true
    @webbed_feet = true
  end
end
