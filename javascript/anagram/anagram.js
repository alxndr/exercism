function alphabetize(letters) {
  return letters.toLowerCase().split('').sort().join('');
}

function is_identical(a, b) {
  return (a.toLowerCase() == b.toLowerCase());
}

function Anagram(word) {
  var letters_to_match = alphabetize(word);

  this.match = function(potential_anagrams) {
    return potential_anagrams.filter(function(potential_match) {
      return (!is_identical(word, potential_match) && alphabetize(potential_match) == letters_to_match);
    });
  };
}

if (module) {
  module.exports = Anagram;
}
