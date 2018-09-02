describe("padding an array", function() {
  describe("when the array length is smaller than the minimum size", function() {
    it("builds an array whose length matches the minimum size", function() {
      var letters = ["a", "b"];
      expect(pad(letters, 4).length).toBe(4);
    })

    it("does not modify the input array", function() {
      var letters = ["a", "b"];
      pad(letters, 4);
      expect(letters).toEqual(["a", "b"]);
    });

    it("uses the elements in the input array at the beginning of the padded array", function() {
      var letters = ["a", "b"];
      expect(pad(letters, 4)[0]).toEqual(letters[0]);
      expect(pad(letters, 4)[1]).toEqual(letters[1]);
    });

    it("fills the padded array with null by default", function() {
      var letters = ["a", "b"];
      expect(pad(letters, 4)).toEqual(["a", "b", null, null]);
    });

    it("can fill the padded array with a given value", function() {
      var letters = ["a", "b"];
      expect(pad(letters, 4, "Z")).toEqual(["a", "b", "Z", "Z"]);
    });
  });

  describe("when the array length is greater than or equal to the minimum size", function() {
    it("does not pad the array when the array length equals the minimum size", function() {
      var letters = ["a", "b"];
      expect(pad(letters, 2)).toEqual(["a", "b"]);
    });

    it("does not pad the array when the array length is greater than the minimum size", function() {
      var letters = ["a", "b"];
      expect(pad(letters, 1)).toEqual(["a", "b"]);
    });

    it("returns a new array, not the input array", function() {
      var letters = ["a", "b"];
      expect(pad(letters, 1)).not.toBe(letters);
    })
  });
});
