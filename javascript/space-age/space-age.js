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

function roundTo(exp, num) { // negative exp to round to decimal places
  return +(Math.round(num + 'e' + -exp) + 'e' + exp);
}

function capitalize(word) {
  return word[0].toUpperCase() + word.slice(1);
}

function converterFor(planet) {
  return function() {
    return roundTo(-2, this.seconds / ORBITAL_PERIODS[planet]);
  };
}

function SpaceAgeConverter(inputSeconds) {
  var api = {
    seconds : inputSeconds
  };

  return Object.keys(ORBITAL_PERIODS).reduce(function(newApi, planet) {
    newApi['on' + capitalize(planet)] = converterFor(planet);
    return newApi;
  }, api);
}

if (module) {
  module.exports = SpaceAgeConverter;
}

