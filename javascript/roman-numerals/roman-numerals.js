DECIMAL_TO_ROMAN = { 1: 'I', 5: 'V', 10: 'X', 50: 'L', 100: 'C', 500: 'D', 1000: 'M' };

function roman_in_place(n, place) {
  switch (n) {
    case 0:
    case 1:
    case 2:
    case 3:
      return DECIMAL_TO_ROMAN[place].repeat(n);
    case 4:
      return DECIMAL_TO_ROMAN[place] + DECIMAL_TO_ROMAN[place * 5];
    case 5:
    case 6:
    case 7:
    case 8:
      return DECIMAL_TO_ROMAN[place * 5] + DECIMAL_TO_ROMAN[place].repeat(n-5);
    case 9:
      return DECIMAL_TO_ROMAN[place] + DECIMAL_TO_ROMAN[place * 10];
    default:
      throw new Error('not a decimal number: "' + n + '"');
  }
}

function convert_to_roman(n) {
  return [1000, 100, 10, 1].reduce(function(in_roman, place) {
    return in_roman + roman_in_place(Math.floor(n / place) % 10, place);
  }, '');
}

if (module) {
  module.exports = convert_to_roman;
}

String.prototype.repeat = function(count) {
  // from http://jsperf.com/faster-string-repeat/12
  if (count < 1) {
    return '';
  }
  var result = '',
    pattern = this.valueOf();
  while (count > 0) {
    if (count & 1) {
      result += pattern;
    }
    count >>= 1;
    pattern += pattern;
  }
  return result;
};
