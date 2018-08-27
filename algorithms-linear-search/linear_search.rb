def linear_search(element, array)
  i = 0
  while i < array.length
    if element == array[i]
      return i
    end
    i += 1
  end
end

def global_linear_search(element, array)
  found = []
  i = 0
  while i < array.length
    if element == array[i]
      found << i
    end
    i += 1
  end
  found
end
