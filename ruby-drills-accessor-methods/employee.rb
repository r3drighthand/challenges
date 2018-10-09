class Employee
  attr_reader :id
  attr_accessor :name, :position

  def initialize(name, position, id)
    @name     = name
    @position = position
    @id       = id
  end
end
