function is_leap_year(year) {
  return (year % 4 === 0 &&
          year % 100 !== 0 ||
          year % 400 === 0);
}

if (module) {
  module.exports = is_leap_year;
}
