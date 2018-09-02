describe("countBetween()", function() {
  it("returns 0 if the array is empty", function() {
    expect(countBetween([], -100, 100)).toEqual(0);
  });

  it("counts the number of values in the array that are between the lower and upper bounds", function() {
    var numbers = [1, 3, 5, 3, 1];
    var lowerBound = 2
    var upperBound = 4

    expect(countBetween(numbers, lowerBound, upperBound)).toEqual(2);
  });

  it("includes values equal to the lower bound", function() {
    var numbers = [1, 2, 3, 5, 3, 2, 1];
    var lowerBound = 2
    var upperBound = 4

    expect(countBetween(numbers, lowerBound, upperBound)).toEqual(4);
  });

  it("includes values equal to the upper bound", function() {
    var numbers = [1, 2, 3, 4, 5, 4, 3, 2, 1];
    var lowerBound = 2
    var upperBound = 4

    expect(countBetween(numbers, lowerBound, upperBound)).toEqual(6);
  });

  it("counts the number of elements equal to the bounds if the lower bound and upper bound are the same", function() {
    var numbers = [1, 2, 1, 1];
    var lowerBound = 1
    var upperBound = 1

    expect(countBetween(numbers, lowerBound, upperBound)).toEqual(3);
  });

  it("does not include values below the lower bound", function() {
    var numbers = [1, 2, 0];
    var lowerBound = 3
    var upperBound = 4

    expect(countBetween(numbers, lowerBound, upperBound)).toEqual(0);
  });

  it("does not include values above the upper bound", function() {
    var numbers = [3, 4];
    var lowerBound = 1
    var upperBound = 2

    expect(countBetween(numbers, lowerBound, upperBound)).toEqual(0);
  });

  it("returns 0 if the upper bound is less than the lower bound", function() {
    var numbers = [1, 2];
    var lowerBound = 1
    var upperBound = 0

    expect(countBetween(numbers, lowerBound, upperBound)).toEqual(0);
  });
});
