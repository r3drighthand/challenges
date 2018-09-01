def convert_to_roman(arabic_number, modern = false)
  old_roman = {
    "M" => 1000,
    "D" => 500,
    "C" => 100,
    "L" => 50,
    "X" => 10,
    "V" => 5,
    "I" => 1
  }

  modern_roman = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  if modern
    hash = modern_roman
  else
    hash = old_roman
  end

  n = arabic_number
  roman_string = ''
  hash.each do |key, value|
    roman_string << key * (n / value)
    n = n % value
  end
  roman_string
end

