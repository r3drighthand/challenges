def prime_factors(number)
  factors = []
  n = 2
  while n <= number
    until number % n != 0
      factors << n
      number = number / n
    end
    n += 1
  end
  factors
end
