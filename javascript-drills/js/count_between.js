function countBetween(array, lowerBound, upperBound) {
  // if(array.length === 0){
  //   return 0;
  var count = 0;
  for(var i = 0; i < array.length; i++){
    if(array[i] >= lowerBound && array[i] <= upperBound){
      count += 1;
    }
  }
  return count;
}
