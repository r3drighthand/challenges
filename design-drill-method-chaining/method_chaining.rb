def shout_backwards(string)
  string.upcase.reverse + "!!!"
end

def squared_primes(array)
  find_all_primes(array).map { |p| p * p }
end

def find_all_primes(array)
  primes = array.find_all do |maybe_prime|
    maybe_divisors = (2...maybe_prime)
    divisors = maybe_divisors.select do |divisor|
      maybe_prime % divisor == 0
    end
    divisors.count == 0 && maybe_prime > 1
  end
end
