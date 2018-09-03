
// We did some stuff for you! This is basic logic for affecting the DOM.
// It short circuits the page's HTML form and fires off a handbuilt JS function.
window.onload = function() {
  var form = document.querySelector('.input-form')
  form.addEventListener('submit',printConvertedValue,false)
}

// This is the function that actually adds the output to the DOM. Don't change
// this!
var printConvertedValue = function(event) {
  event.preventDefault()
  var number = this.number.value
  var outputDiv = document.querySelector('.output')
  outputDiv.innerText = numeralConverter(number)
}


// numeralConverter takes a string that looks like a number as an input, e.g. '111'.
// numeralConverter should output a string of characters corresponds to a Roman Numeral, e.g. 'XXVI'
var numeralConverter = function(numString) {
  var numInteger = Number(numString);
  var output = "";
  if (numInteger < 10) {
    output = units(numInteger);
  }
  else if (numInteger < 100) {
    output = tens(numInteger).concat(units(numInteger));
  }
  else if (numInteger < 1000) {
    output = hundreds(numInteger).concat(tens(numInteger)).concat(units(numInteger));
  }
  else {
    output = "M"
  }
  return output
}

// your helper functions go here!
function units(numInteger) {
  numInteger %= 10;
  var output = "";
  if (numInteger < 5) {
    for( var i=0; i < numInteger; i++) {
      output = output.concat("I");
    }
  }
  else if (numInteger < 10) {
    output = "V";
    for ( var i=0; i < (numInteger - 5); i++) {
      output = output.concat("I");
    }
  }
  return output
}

function tens(numInteger) {
  output = "";
  var stop = ((numInteger - (numInteger % 10)) / 10) % 10 ;
  if (stop < 5) {
    for ( var i=0; i < stop; i++) {
      output = output.concat("X");
    }
  }
  else {
    output = 'L';
    for ( var i=0; i < (stop - 5); i++) {
      output = output.concat("X");
    }
  }
  return output;
}

function hundreds(numInteger) {
  output = "";
  var stop = (numInteger - (numInteger % 100)) / 100 ;
  if (stop < 5) {
    for ( var i=0; i < stop; i++) {
      output = output.concat("C");
    }
  }
  else {
    output = 'D';
    for ( var i=0; i < (stop - 5); i++) {
      output = output.concat("C");
    }
  }
  return output;
}