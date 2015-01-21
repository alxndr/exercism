function SpaceAgeConverter(inputSeconds) {

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

  function makeConversionFor(planet) {
    var planetsOrbitalPeriod = ORBITAL_PERIODS[planet];
    return function() {
      var theAnswer = this.seconds / planetsOrbitalPeriod;
      return NumberHelper.roundTo(-2, theAnswer);
    };
  }

  var api = {
    seconds : inputSeconds
  };

  return Object.keys(ORBITAL_PERIODS).reduce(function(newApi, planet) {
    var methodName = 'on' + StringHelper.capitalize(planet);
    newApi[methodName] = makeConversionFor(planet);

    return newApi;
  }, api);
}

var NumberHelper = {
  roundTo: function(exponent, number) {
    // negative exponent rounds to decimal places
    return +(Math.round(number + 'e' + -exponent) + 'e' + exponent);
  }
};
var StringHelper = {
  capitalize: function(word) {
    return word[0].toUpperCase() + word.slice(1);
  }
}

if (module) {
  module.exports = SpaceAgeConverter;
}

