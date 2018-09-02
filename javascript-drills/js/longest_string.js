function longestString(strings) {
  if(strings.length === 0){
    return null;
  }
  var longString = "";
  for(var i = 0; i < strings.length; i++){
    if(longString.length < strings[i].length){
      longString = strings[i];
    }
  }
  return longString;
}
