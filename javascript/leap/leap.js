function Year(year) {
  function is_divisible_by_four() {
    return year % 4 === 0;
  }
  function is_not_century() {
    return year % 100 !== 0;
  }
  function is_quad_century() {
    return year % 400 === 0;
  }

  this.is_leap_year = function() {
    return is_divisible_by_four() &&
      is_not_century() ||
      is_quad_century();
  };
}

function is_leap_year(year) {
  return new Year(year).is_leap_year();
}

if (module) {
  module.exports = is_leap_year;
}
