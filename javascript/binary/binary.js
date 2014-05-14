function sum_powers_of_two(sum, value, power) {
  return sum + (value === '1' ? Math.pow(2, power) : 0);
}

function Binary(input) {
  var decimal_value;
  input = input.match(/[01]/g) || [];
  decimal_value = input.reverse().reduce(sum_powers_of_two, 0);

  function get_decimal() {
    return decimal_value;
  }

  return {
    toDecimal: get_decimal
  };
}

if (module) {
  module.exports = Binary;
}
