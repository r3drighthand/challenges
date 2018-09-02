describe("longestString", function() {
  it("returns null when the array is empty", function() {
    var emptyArray = [];

    expect(longestString(emptyArray)).toEqual(null);
  });

  it("returns the longest string in the array", function() {
    var alphabetString = "abcdefghijklmnopqrstuvwxyz";
    var strings = ["a", "ab", "bc", alphabetString, "cd"];

    expect(longestString(strings)).toEqual(alphabetString);
  });

  it("returns the only string when the array has one string", function() {
    var onlyString = "Jayda";
    var oneStringArray = [onlyString];

    expect(longestString(oneStringArray)).toEqual(onlyString);
  });

  it("returns empty strings when there are no longer strings in the array", function() {
    var emptyString = "";
    var strings = [emptyString];

    expect(longestString(strings)).toEqual(emptyString);
  });

  it("returns the first longest string in the array if multiple strings share the longest length", function() {
    var firstOccuringLongestString   = "aaaaaaaaaa";
    var secondOccurringLongestString = "bbbbbbbbbb";
    var strings = ["ab", "bc", firstOccuringLongestString, "cd", secondOccurringLongestString, "de"];

    expect(longestString(strings)).toEqual(firstOccuringLongestString);
  });
});
