function Reaction(input) {
  this.input = input;
  this.test = function() { return true; };
  this.response = 'Whatever.';
  this.get_response = function() { return this.response; };
}

function SilentReaction() {
  Reaction.apply(this, arguments);
  this.test = function is_silent() { return (this.input === ''); };
  this.response = 'Fine. Be that way!';
}
SilentReaction.prototype = Object.create(Reaction.prototype);

function YellingReaction() {
  Reaction.apply(this, arguments);
  this.test = function is_yelling() { return (this.input.toUpperCase() === this.input && /[A-Z]/.test(this.input)); };
  this.response = 'Woah, chill out!';
}
YellingReaction.prototype = Object.create(Reaction.prototype);

function QuestioningReaction() {
  Reaction.apply(this, arguments);
  this.test = function is_questioning() { return (this.input.slice(-1) === '?' && !new YellingReaction(this.input).test()); };
  this.response = 'Sure.';
}
QuestioningReaction.prototype = Object.create(Reaction.prototype);

function Bob() {
  var REACTIONS = [ SilentReaction, YellingReaction, QuestioningReaction, Reaction ];

  function respond_to(stimulus) {
    var response;
    stimulus = stimulus.trim();
    REACTIONS.some(function(AReaction) {
      var reaction = new AReaction(stimulus);
      if (reaction.test()) {
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
