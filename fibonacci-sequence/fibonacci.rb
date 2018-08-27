def iterative_nth_fibonacci_number(n)
  fib = [0, 1]
  counter = 0
  while counter < n
    fib << fib[counter] + fib[counter+1]
    counter += 1
  end
  fib[n]
end

def recursive_nth_fibonacci_number(n)
  if n < 2
    return n
  else
    recursive_nth_fibonacci_number(n-1) + recursive_nth_fibonacci_number(n-2)
  end
end

