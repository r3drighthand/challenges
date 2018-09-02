function total(numbers) {
  var numTotal = 0;
  for(var i = 0; i < numbers.length; i++){
    numTotal += numbers[i];
  }
  return numTotal;
};

function mean(numbers) {
  var total = 0;
  for(var i = 0; i < numbers.length; i++){
    total += numbers[i];
  }
  return total/numbers.length;
};

// even, odd, unsorted
function median(numbers) {
  var numbersSorted = numbers.sort();
  var midPoint = Math.floor(numbers.length/2);
  if(numbers.length % 2){
    return numbersSorted[midPoint];
  } else {
    return (numbersSorted[midPoint-1] + numbersSorted[midPoint]) / 2;
  }
};

function mode(numbers) {
  var mostFrequent = [];
  var highestCount = 0;
  var count;

  numbers.forEach(function(numberCompare){
    count = 0;
    numbers.forEach(function(number){
      if(numberCompare === number){
        count += 1;
      }
    });
    if(count > highestCount){
      highestCount = count;
      mostFrequent = [numberCompare];
    } else if(count === highestCount && !mostFrequent.includes(numberCompare)){
      mostFrequent.push(numberCompare);
    }
  })
  return mostFrequent;
};
