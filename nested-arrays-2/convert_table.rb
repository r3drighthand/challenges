def convert_table(table)
  keys = table[0]
  i= 1
  answers_array =[]
  while i < table.length
    x=0
    answers ={}
    row = table[i]
      while x < row.length
        value = row[x]
        answers[keys[x]] = value
        # << keys[x] => value
        x+=1
      end
      answers_array << answers
      i+=1
    end
  answers_array
end

table_data = [
  ["first_name", "last_name", "city", "state"],
  ["Elisabeth", "Gardenar", "Toledo", "OH"],
  ["Jamaal", "Du", "Sylvania", "OH"],
  ["Kathlyn", "Lavoie", "Maumee", "OH"]
]

table_hash =  [
  { "first_name" => "Elisabeth", "last_name" => "Gardenar", "city" => "Toledo", "state" => "OH" },
  { "first_name" => "Jamaal", "last_name" => "Du", "city" => "Sylvania", "state" => "OH" },
  { "first_name" => "Kathlyn", "last_name" => "Lavoie", "city" => "Maumee", "state" => "OH" }
 ]

 p convert_table(table_data)
