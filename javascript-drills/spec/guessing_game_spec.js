describe("GuessingGame", function() {
  var game;

  beforeEach(function() {
    game = new GuessingGame(10);
  });

  describe("guess()", function() {
    it("expects a single argument", function() {
      expect(GuessingGame.length).toBe(1);
    });

    it("returns 'high' when the guess is too high", function() {
      expect(game.guess(100)).toEqual("high");
    });

    it("returns 'low' when the guess is too low", function() {
      expect(game.guess(0)).toEqual("low");
    });

    it("returns 'correct' when the guess is correct", function() {
      expect(game.guess(10)).toEqual("correct");
    });

    it("changes the game to solved when a correct guess is made", function() {
      expect(game.isSolved()).toBe(false);
      game.guess(10);
      expect(game.isSolved()).toBe(true);
    });

    it("does not change the game to solved when an incorrect guess is made", function() {
      expect(game.isSolved()).toBe(false);
      game.guess(5);
      expect(game.isSolved()).toBe(false);
    });

    it("changes the game back to unsolved if an incorrect guess is made after a correct guess", function() {
      expect(game.isSolved()).toBe(false);
      game.guess(10);
      expect(game.isSolved()).toBe(true);
      game.guess(5);
      expect(game.isSolved()).toBe(false);
    });
  });

  describe("isSolved()", function() {
    it("expects no arguments", function() {
      expect(game.isSolved.length).toBe(0);
    });

    it("returns false before a guess is made", function() {
      expect(game.isSolved()).toBe(false);
    });
  });
});
