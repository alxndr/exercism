function is_silent(text) {
  return (text === '');
}
function is_yelling(text) {
  return (text.toUpperCase() === text && /[A-Z]/.test(text));
}
function is_questioning(text) {
  return (text.slice(-1) === '?' && !is_yelling(text));
}

function Bob() {
  var DEFAULT = 'default'; // weird
  var RESPONSES = [
    { test: is_silent,      result: 'Fine. Be that way!' },
    { test: is_yelling,     result: 'Woah, chill out!' },
    { test: is_questioning, result: 'Sure.' },
    { test: DEFAULT,        result: 'Whatever.' }
  ];

  function respond_to(stimulus) {
    var response;
    stimulus = stimulus.trim();
    RESPONSES.some(function(registered_response) {
      var test_method = registered_response.test;
      if (test_method === DEFAULT || test_method(stimulus)) {
        response = registered_response.result;
        return true;
      }
    });
    return response;
  }

  // public interface
  this.hey = function respond_to_stimulus(stimulus) {
    return respond_to(stimulus);
  };
}

if (module) {
  module.exports = Bob;
}
