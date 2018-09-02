describe("validTriangle()", function() {
  it("expects three arguments", function() {
    expect(validTriangle.length).toBe(3);
  });

  it("returns false if any side length is 0", function() {
    expect(validTriangle(1,1,0)).toBe(false);
    expect(validTriangle(1,0,1)).toBe(false);
    expect(validTriangle(0,1,1)).toBe(false);
  });

  it("returns true if the side lengths form a valid triangle", function() {
    expect(validTriangle(10,10,10)).toBe(true);
  });

  it("returns false if the side lengths do not form a valid triangle", function() {
    expect(validTriangle(1, 1, 20)).toBe(false);
  })

  it("does not depend on the order of the arguments", function() {
    expect(validTriangle(65, 72, 97)).toBe(true);
    expect(validTriangle(97, 65, 72)).toBe(true);
    expect(validTriangle(2, 3, 3000)).toBe(false);
    expect(validTriangle(3, 3000, 2)).toBe(false);
  });
});
