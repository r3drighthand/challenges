var sudoku = require('sudoku');

var puzzle = sudoku.makepuzzle();
var solution   = sudoku.solvepuzzle(puzzle);
var difficulty = sudoku.ratepuzzle(puzzle, 4);

var unsolvedString = ""
var solutionString = ""

for (var i = 0; i < puzzle.length; i++) {
  if (puzzle[i] != null) {
    unsolvedString += (puzzle[i] + 1).toString();
  } else {
    unsolvedString += "-";
  }
}

for (var i = 0; i < solution.length; i++) {
  solutionString += (solution[i] + 1).toString();
}

// Driver code below

console.log("\nThe following puzzle has a relative difficulty of:");
console.log(difficulty);

console.log("\nBelow is an unsolved puzzle string:\n");
console.log(unsolvedString);

console.log("\nBelow is the corresponding solved puzzle string:\n");
console.log(solutionString);
