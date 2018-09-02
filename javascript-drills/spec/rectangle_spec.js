describe("rectangle functions", function() {
  describe("area()", function() {
    it("calculates the area of a rectangle", function() {
      var rectangle = { width: 10, height: 20 };
      expect(area(rectangle)).toBe(200);
    });

    it("calculates the area of a square", function() {
      var square = { width: 20, height: 20 };
      expect(area(square)).toBe(400);
    });
  });

  describe("perimeter()", function() {
    it("calculates the perimeter of a rectangle", function() {
      var rectangle = { width: 10, height: 20 };
      expect(perimeter(rectangle)).toBe(60);
    });

    it("calculates the perimeter of a square", function() {
      var square = { width: 20, height: 20 };
      expect(perimeter(square)).toBe(80);
    });
  });

  describe("diagonal()", function() {
    it("calculates the diagonal of a rectangle", function() {
      var rectangle = { width: 10, height: 20 };
      expect(diagonal(rectangle)).toBe(22.360679774997898);
    });

    it("calculates the diagonal of a square", function() {
      var square = { width: 20, height: 20 };
      expect(diagonal(square)).toBe(28.284271247461902);
    });
  });

  describe("isSquare()", function() {
    it("returns false if the rectangle is not a square", function() {
      var rectangle = { width: 10, height: 20 };
      expect(isSquare(rectangle)).toBe(false);
    });

    it("returns true if the rectangle is a square", function() {
      var square = { width: 20, height: 20 };
      expect(isSquare(square)).toBe(true);
    });
  });
});
