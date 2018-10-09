module AreaCalculator
  def self.area_of_rectangle(width, length)
    width * length
  end

  def self.area_of_square(side)
    side ** 2
  end

  def self.area_of_triangle(base, height)
    (base * height) / 2
  end
end