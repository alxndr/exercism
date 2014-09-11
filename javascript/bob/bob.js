function function_that_returns(thing) {
  return function() { return thing; };
}

function Reaction() {
  var response = 'Whatever.';

  function yep() {
    return true;
  }

  return {
    test: yep,
    get_response: function_that_returns(response)
  };
}

function SilentReaction() {
  var response = 'Fine. Be that way!';

  function is_silent(input) {
    return (input === '');
  }

  return {
    test: is_silent,
    get_response: function_that_returns(response)
  };
}

function YellingReaction() {
  var response = 'Woah, chill out!';

  function is_yelling(input) {
    return (input.toUpperCase() === input && /[A-Z]/.test(input));
  }

  return {
    test: is_yelling,
    get_response: function_that_returns(response)
  };
}

function QuestioningReaction() {
  var response = 'Sure.';

  function is_questioning(input) {
    return (input.slice(-1) === '?' && !new YellingReaction().test(input));
  }

  return {
    test: is_questioning,
    get_response: function_that_returns(response)
  };
}

function Bob() {

  var REACTIONS = [
    SilentReaction,
    YellingReaction,
    QuestioningReaction,
    Reaction
  ];

  function respond_to(stimulus) {
    var response;
    stimulus = stimulus.trim();

    REACTIONS.some(function(AReaction) {
      var reaction = new AReaction();
      if (reaction.test(stimulus)) {
        response = reaction.get_response();
        return true;
      }
    });

    return response;
  }

  this.hey = respond_to;
}

if (module) {
  module.exports = Bob;
}
