function pad(array, minSize, value=null){
  var outputArray = []
  if(array.length >= minSize){
    for(var i = 0; i < array.length; i++){
      outputArray.push(array[i]);
    }
  } else {
    for(var i = 0; i < array.length; i++){
      outputArray.push(array[i]);
    }
    for(var i = array.length; i < minSize; i++){
      outputArray.push(value);
    }
  }
  return outputArray;
};
