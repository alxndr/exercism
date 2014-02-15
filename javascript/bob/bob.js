function Bob() {
  function is_silent(text) {
    return (!text.length);
  }
  function is_questioning(text) {
    return (/\?$/.test(text));
  }
  function is_yelling(text) {
    return (text.toUpperCase() == text && /[A-Z]/.test(text));
  }
  this.hey = function hey(stimulus) {
    stimulus = stimulus.trim();
    switch (true) {
      case is_silent(stimulus):
        return 'Fine. Be that way!';

      case is_yelling(stimulus):
        return 'Woah, chill out!';

      case is_questioning(stimulus):
        return 'Sure.';

      default:
        return 'Whatever.';
    }
  };
}

if (module) {
  module.exports = Bob;
}
