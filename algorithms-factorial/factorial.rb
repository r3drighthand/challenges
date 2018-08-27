def factorial_iterative(n)
  factorial = 1
  until n == 0
    factorial *= n
    n -= 1
  end
  factorial
end

def factorial_recursive(n)
  if n == 0
    return 1
  else
    n * factorial_recursive(n-1)
  end
end
