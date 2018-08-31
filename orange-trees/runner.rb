require_relative 'orange'
require_relative 'orange_tree'


tree = OrangeTree.new

# Let seasons pass until the tree is ready to bear fruit.
tree.pass_growing_season until tree.mature?


# Report yearly harvest information for the lifetime of the tree.
until tree.dead?
  tree.pass_growing_season

  harvested_oranges = []

  while tree.has_oranges?
    harvested_oranges << tree.pick_an_orange
  end

  # Need to calculate the average diameter for this harvest.
  average_orange_diameter = (harvested_oranges.inject(0) { |sum, orange| sum + orange.diameter } / harvested_oranges.length).round(2)

  # need to count all orange objects in orange array, divide by how many there are (length)
  # use inject to sum orange diamters, divide by size of array
  # round average to 2nd decimal (round(2))

  puts <<-HARVEST_REPORT.gsub(/^ {4}/, '')
    YEAR #{tree.age} REPORT
    -----------------------
    Height: #{tree.height} feet.
    Harvest: #{harvested_oranges.size} oranges with an average diameter of #{average_orange_diameter} inches.


  HARVEST_REPORT
end

puts "Alas, the tree, she is dead!"
