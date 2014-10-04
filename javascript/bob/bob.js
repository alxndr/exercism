function Bob() {

  var REACTIONS = [
    SilentReaction,
    YellingReaction,
    QuestioningReaction,
    Reaction
  ];

  function respondTo(stimulus) {
    stimulus = stimulus.trim();
    return REACTIONS.reduce(function(response, AReaction) {
      if (response) {
        return response;
      }
      var reaction = new AReaction();
      if (reaction.test(stimulus)) {
        return reaction.response;
      }
    }, null);
  }

  return {
    hey: respondTo
  };
}

function Reaction() {
  return {
    response: 'Whatever.',
    test: function always() {
      return true;
    }
  };
}

function SilentReaction() {
  return {
    response: 'Fine. Be that way!',
    test: function isSilent(input) {
      return (input === '');
    }
  }
}

function YellingReaction() {
  return {
    response: 'Woah, chill out!',
    test: function isYelling(input) {
      return (input.toUpperCase() === input && /[A-Z]/.test(input));
    }
  };
}

function QuestioningReaction() {
  return {
    response: 'Sure.',
    test: function isQuestioning(input) {
      return (input.slice(-1) === '?' && !new YellingReaction().test(input));
    }
  };
}


if (module) {
  module.exports = Bob;
}
