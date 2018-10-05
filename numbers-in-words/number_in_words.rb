def number_in_words(integer)
  one_to_twenty = {
    1 => "one",
    2 => "two",
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'fifteen',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'nineteen',
    20 => 'twenty'
  }
end

array = gets.chomp
ones = array[-1]
tens = array[-2]
hundreds = array[-3]

tens_place = {
  '2' => 'twenty',
  '3' => 'thirty',
  '4' => 'forty',
  '5' => 'fifty',
  '6' => 'sixty',
  '7' => 'seventy',
  '8' => 'eighty',
  '9' => 'ninety'
}

puts one_to_twenty[hundreds] + " hundred " + tens_place[tens] + " " + one_to_twenty[ones]