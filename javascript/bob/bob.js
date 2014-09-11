function Reaction() {

  function yep() {
    return true;
  }

  return {
    test: yep,
    response: 'Whatever.'
  };
}

function SilentReaction() {

  function is_silent(input) {
    return (input === '');
  }

  return {
    test: is_silent,
    response: 'Fine. Be that way!'
  };
}

function YellingReaction() {

  function is_yelling(input) {
    return (input.toUpperCase() === input && /[A-Z]/.test(input));
  }

  return {
    test: is_yelling,
    response: 'Woah, chill out!'
  };
}

function QuestioningReaction() {

  function is_questioning(input) {
    return (input.slice(-1) === '?' && !new YellingReaction().test(input));
  }

  return {
    test: is_questioning,
    response: 'Sure.'
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
        response = reaction.response;
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
