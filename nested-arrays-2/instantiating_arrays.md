# Instantiating Arrays

What is the difference between the following code snippets?  What happens when each is run?

 - 'Array.new(5, rand(20))'
- 'Array.new(5) { rand(20) }'

The first snippet evaluates the second argument first. In this case, it selects a raandom number between 1 and 20, and the second argument is set to that value
  e.x. the line now equals Array.new(5, 18)
Ruby then checks the first argument, to check how many copies of the second argument need to be put into an array.
  array = [18, 18, 18,18, 18]


In the second snippet, we tell Ruby to first create an array with a length of five, and then to operate the code block for each element. The rand command is thus executed once for each element, and five times total, resulting in a new random number for each iteration. The random numbers are assigned to an elemenet in the array one at a time, resulting in an array with varying values.
