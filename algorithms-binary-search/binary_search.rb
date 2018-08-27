def binary_search(array, object, low = 0, high = array.length-1)
  return low if low == high
  return high if object == array[high]
  return low if object == array[low]
  return nil if array[low..high].length <= 2

  mid_point = low + (array[low..high].length / 2)
  mid_value = array[mid_point]

  if mid_value == object
    return mid_point
  elsif mid_value > object
    high = mid_point
  elsif mid_value < object
    low = mid_point
  end

  binary_search(array, object, low, high)
end