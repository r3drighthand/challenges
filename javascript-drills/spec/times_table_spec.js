describe("timesTable()", function() {
  // These are regular expressions which match the output
  // of the 2x2 and 5x5 times tables in a way that doesn't care how you
  // separate columns, so long as they're separated by whitespace
  var regexTwo  = /1\s+2\s*\n2\s+4\s*$/m
  var regexFive = /1\s+2\s+3\s+4\s+5\s*\n2\s+4\s+6\s+8\s+10\s*\n3\s+6\s+9\s+12\s+15\s*\n4\s+8\s+12\s+16\s+20\s*\n5\s+10\s+15\s+20\s+25\s*$/m;

  it("renders a 1 x 1 times table", function() {
    expect(timesTable(1)).toMatch(/1\s*$/);
  });

  it("renders a 2 x 2 times table", function() {
    expect(timesTable(2)).toMatch(regexTwo);
  })

  it("renders a 5 x 5 times table", function() {
    expect(timesTable(5)).toMatch(regexFive);
  });

  it("renders a 0 x 0 times table as an empty string", function() {
    expect(timesTable(0)).toEqual("");
  });
});
