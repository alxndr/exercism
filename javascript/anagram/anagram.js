function Anagram(word) {
  var letters_to_match = alphabetize(word);

  this.match = function(potential_anagrams) {
    return potential_anagrams.filter(function(potential_match) {
      return (!is_identical(potential_match) && alphabetize(potential_match) == letters_to_match);
    });
  };

  function alphabetize(t) {
    return t.toLowerCase().split('').sort().join('');
  }
  function is_identical(t) {
    return (t.toLowerCase() == word.toLowerCase());
  }

}

if (module) {
  module.exports = Anagram;
}
