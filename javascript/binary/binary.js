function Binary(input) {
  var decimal_value;

  input = input.replace(/[^01]/g, '');
  decimal_value = parseInt(input, 2) || 0;

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
