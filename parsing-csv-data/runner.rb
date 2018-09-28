require_relative 'person'
require_relative 'person_parser'
require_relative 'person_writer'


if ARGV.any?
  command = ARGV.first
  options = ARGV[1..-1]

  people = PersonParser.parse('people.csv') unless command == "add"

  case command
  when "area code"
    then
      area_code = options.first
      people_in_area_code = people.select { |person| person.area_code?(area_code) }

      puts "The following people have phone numbers from area code #{area_code}."
      people_in_area_code.each { |person| puts person.full_name }
  when "last name"
    then
      last_name = options.first
      people_with_last_name = people.select { |person| person.last_name?(last_name) }

      puts "The following people have the same last name, #{last_name}"
      people_with_last_name.each { |person| puts person.full_name}
  when "email domain"
    then
      email_domain = options.first
      people_with_email_domain = people.select { |person| person.email_domain?(email_domain) }

      puts "The following people have the same #{email_domain} as their domain"
      people_with_email_domain.each { |person| puts person.full_name }
  when "born after"
    then
      year_marker = options.first
      people_born_after = people.select { |person| person.born_after?(year_marker) }

      puts "The following people were born after #{year_marker}"
      people_born_after.each { |person| puts person.full_name }
  when "add"
    then
      new_person = options
      person_data = {}
      person_data[:first_name] = new_person[0]
      person_data[:last_name] = new_person[1]
      person_data[:email] = new_person[2]
      person_data[:phone] = new_person[3]
      person_data[:born_at] = new_person[4]
      person_data[:born_at] = DateTime.parse(person_data[:born_at])

      person = Person.new(person_data)

      PersonWriter.append('people.csv', person)
      puts "New person added: #{person.full_name}"
  else
    puts "Unsupported command '#{command}'."
  end
end
