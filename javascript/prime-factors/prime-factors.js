/* global module */

var find_factors = function(n) {
  if (n <= 1 || !n) {
    return [];
  }
  var i = 2;
  while (n % i) {
    i++;
  }
  var factors = [];
  factors.push(i);
  var more = find_factors(n / i);
  if (more.length) {
    factors = factors.concat(more);
  }
  return factors;
};

var prime_factors = {
  for: find_factors
};

if (module) {
  module.exports = prime_factors;
}
