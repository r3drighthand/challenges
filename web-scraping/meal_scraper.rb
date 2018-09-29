require 'nokogiri'
require 'open-uri'
require_relative 'meal'

module MenuScraper
  attr_reader :entrees, :sides, :prices

  def self.scrape_site(url)
    Nokogiri::HTML(open(url))
  end

  def create_menu(page)
    menu = []
    menu << save_entree(page)
    menu << save_sides(page)
    menu << save_price(page)
    menu.transpose
  end

  def save_entree(page)
    entree = page.css(".menu-list-item-entree-name")
    entrees = []
    entree.each do |entree|
      entrees << entree.text
    end
    entrees
  end

  def save_sides(page)
    side = page.css(".menu-list-item-sides")
    sides = []
    side.each do |side|
      sides << side.text
    end
    sides
  end

  def save_price(page)
    price = page.css(".menu-list-item_price")
    prices = []
    price.each do |price|
      prices << price.text
    end
    prices
  end

end
