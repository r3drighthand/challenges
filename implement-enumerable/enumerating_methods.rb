def each(array)
  i = 0
  while i < array.length
    yield(array[i])
    i += 1
  end
end

def find(array)
  i = 0
  while i < array.length
    if yield(array[i])
      return array[i]
    end
    i += 1
  end
end

def map(array)
  new_array = []
  i = 0
  while i < array.length
    new_array << yield(array[i])
    i += 1
  end
  new_array
end

def reject(array)
  new_array = []
  i = 0
  while i < array.length
    if !yield(array[i])
      new_array << array[i]
    end
    i += 1
  end
  new_array
end

def select(array)
  new_array = []
  i = 0
  while i < array.length
    if yield(array[i])
      new_array << array[i]
    end
    i += 1
  end
  new_array
end

# Coding all? is optional.
def all?(array)
end

# Coding reduce is optional.
def reduce(array, starting_value = nil)
end
def each(array)
  i = 0
  while i < array.length
    yield(array[i])
    i += 1
  end
end

def find(array)
end

def map(array)
end

def reject(array)
end

def select(array)
end

# Coding all? is optional.
def all?(array)
end

# Coding reduce is optional.
def reduce(array, starting_value = nil)
end
