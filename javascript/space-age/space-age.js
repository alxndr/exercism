var EARTH_YR_IN_SEC = 31557600;
var ORBITAL_PERIODS = {
  mercury: EARTH_YR_IN_SEC * 0.2408467,
  venus:   EARTH_YR_IN_SEC * 0.61519726,
  earth:   EARTH_YR_IN_SEC,
  mars:    EARTH_YR_IN_SEC * 1.8808158,
  jupiter: EARTH_YR_IN_SEC * 11.862615,
  saturn:  EARTH_YR_IN_SEC * 29.447498,
  uranus:  EARTH_YR_IN_SEC * 84.016846,
  neptune: EARTH_YR_IN_SEC * 164.79132
};

function round_to(exp, num) { // negative exp to round to decimal places
  return +(Math.round(num + 'e' + -exp) + 'e' + exp);
}
function capitalize(word) {
  return word[0].toUpperCase() + word.slice(1);
}
function converter_for(planet) {
  return function converter() {
    return round_to(-2, this.seconds / ORBITAL_PERIODS[planet]); // did not expect `this` to be the SpaceAgeConverter instance
  };
}

function SpaceAgeConverter(input_seconds) {
  var self = this;

  this.seconds = input_seconds;
  Object.keys(ORBITAL_PERIODS).forEach(function define_conversion_method(planet) {
    self['on' + capitalize(planet)] = converter_for(planet);
  });
}

if (module) {
  module.exports = SpaceAgeConverter;
}

