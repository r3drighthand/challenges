require 'csv'
require_relative "person"

module PersonWriter
  def self.append(filename, person)

    CSV.open(filename, "a+") do |csv|
      csv << [person.first_name, person.last_name, person.email, person.phone,  person.born_at.strftime('%Y-%m-%d %H:%M:%S')]
    end

  end
end
