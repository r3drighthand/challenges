class Meal
  attr_reader :entree, :sides, :price

  def initialize(args={})
    @entree = args[:entree]
    @sides = args[:sides]
    @price = args[:price]
  end

  def self.display(meal)
    puts "#{meal.entree.upcase}"
    puts "#{meal.sides}".ljust(70, '.') + "#{meal.price}\n\n"
  end
end
