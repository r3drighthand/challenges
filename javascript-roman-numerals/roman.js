
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


var numeralConverter = function(numString) {
  var convert_roman_numerals = {
    1: 'I',
    4: 'IV',
    5: 'V',
    9: 'IX',
    10: 'X',
    40: 'XL',
    50: 'L',
    90: 'XC',
    100: 'C',
    400: 'CD',
    500: 'D',
    900: 'CM',
    1000: 'M'
  }

  var int = parseInt(numString);
  var string = ''

 while (int > 0) {
    var number = Object.keys(convert_roman_numerals).filter(function(key){
      return key <= int;
    });

    var max = number[number.length - 1]

    if (number.length === 1 ) { max = 1 }

    string += (convert_roman_numerals[max])
    int -= parseInt(max)
  }

  return string;
}