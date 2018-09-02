function GuessingGame(answer) {
  this.answer = answer;
  this.solved = false;
}

GuessingGame.prototype.guess = function(playerGuess) {
  this.solved = false;
  if(playerGuess > this.answer){
    return "high";
  } else if(playerGuess < this.answer){
    return "low";
  } else {
    this.solved = true;
    return "correct";
  }
}

GuessingGame.prototype.isSolved = function(){
  return this.solved;
}
