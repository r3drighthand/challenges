require 'csv'
require_relative "person"

module PersonParser
  def self.parse(filename)
    people = []

    CSV.foreach(filename, headers:true, converters: :date_time, header_converters: :symbol)do |row|
      people << Person.new(row)
    end
    people
  end
end
