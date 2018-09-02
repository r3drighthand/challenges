function timesTable(number) {
  var iOne = 1;
  var iTwo;
  var numString = '';
  for (; iOne <= number; iOne += 1){
    iTwo = 1;
    for(; iTwo <= number; iTwo += 1){
      numString = numString.concat((iTwo * iOne).toString()).concat(' ');
    }
    numString = numString.concat('\n');
  }
  return numString;
}
