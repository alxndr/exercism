function Bob() {
  function is_silent(text) {
    return (text === '');
  }
  function is_questioning(text) {
    return (text.slice(-1) === '?');
  }
  function is_yelling(text) {
    return (text.toUpperCase() === text && /[A-Z]/.test(text));
  }
  function respond_to_stimulus(stimulus) {
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
  }

  // public interface
  this.hey = respond_to_stimulus;
}

if (module) {
  module.exports = Bob;
}
