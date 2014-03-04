function sum_powers_of_two(sum, value, power) {
  return sum + (value === '1' ? Math.pow(2, power) : 0);
}

function Binary(input) {
  var decimal_value = ( input.match(/[01]/g) || [] ).reverse().reduce(sum_powers_of_two, 0);

  function to_decimal() {
    return decimal_value;
  }

  this.toDecimal = to_decimal;
}

if (module) {
  module.exports = Binary;
}
