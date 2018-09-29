require 'open-uri'
require 'nokogiri'
require_relative 'meal'
require_relative 'menu_scraper'

include MenuScraper

page = MenuScraper.scrape_site("https://devbootcamp-curriculum.github.io/cafeteria/")

if ARGV.any?

  if page.css('.menu-list-item').text.include? ARGV[0]

    all_meals = create_menu(page).each_with_object([]) do |item, arr|
      arr << Meal.new(entree: item[0], sides: item[1], price: item[2])
    end

    all_meals.each do |meal|
      if meal.entree.include? ARGV[0]
        Meal.display(meal)
      elsif meal.sides.include? ARGV[0]
        Meal.display(meal)
      end
    end

  else
    puts "We don't have that. Pick something else."
  end

else
  raise StandardError, "Please input a food item."
end
