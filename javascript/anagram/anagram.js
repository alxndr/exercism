function Anagram(starting_word) {
  function is_an_anagram(other_word) {
    other_word = other_word.toLowerCase();
    return (starting_word !== other_word && starting_word_alphabetized === other_word.alphabetize());
  }
  function find_matches_among(potential_anagrams) {
    return potential_anagrams.filter(is_an_anagram);
  }
  starting_word = starting_word.toLowerCase();
  starting_word_alphabetized = starting_word.alphabetize();

  this.match = find_matches_among;
}

if (module) {
  module.exports = Anagram;
}

String.prototype.alphabetize = function String_alphabetize() {
  return this.toLowerCase().split('').sort().join('');
};
