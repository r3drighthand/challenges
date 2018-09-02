describe("calculating totals and averages", function() {
  describe("total()", function() {
    it("calculates the sum of the numbers in the array", function() {
      var numbers = [1, 1, 2, 1];
      expect(total(numbers)).toBe(5);

      var moreNumbers = [2, 2, 2, 6];
      expect(total(moreNumbers)).toBe(12);
    });
  });

  describe("mean()", function() {
    it("calculates the mean of the numbers in the array", function() {
      var numbers = [1, 1, 1, 5];
      expect(mean(numbers)).toBe(2);

      var moreNumbers = [2, 2, 2, 6];
      expect(mean(moreNumbers)).toBe(3);
    });
  });

  describe("median()", function() {
    it("calculates the median of the numbers in an odd-length array", function() {
      var numbers = [1, 2, 3];
      expect(median(numbers)).toBe(2);
    });

    it("calculates the median of the numbers in an even-length array", function() {
      var numbers = [1, 2, 3, 4];
      expect(median(numbers)).toBe(2.5);
    });

    it("calculates the median when the array is not sorted", function() {
      var numbers = [2, 1, 5, 3, 4, 6];
      expect(median(numbers)).toBe(3.5);
    });
  });

  describe("mode()", function() {
    it("returns an array containing the mode of the numbers in the array", function() {
      var numbers = [1, 2, 4, 2, 4, 3, 4];
      expect(mode(numbers)).toEqual([4]);
    });

    it("returns multiple numbers when two values reoccur the same number of times", function() {
      var numbers = [1, 2, 2, 3, 4, 3];
      expect(mode(numbers)).toEqual([2, 3]);
    });
  });
});
