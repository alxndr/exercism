function Anagram(word) {
  var letters_to_match = alphabetize(word);

  this.match = function(potential_anagrams) {
    var anagrams = [];
    for (var i in potential_anagrams) {
      var potential_match = potential_anagrams[i];
      if (is_identical(potential_match)) {
        continue;
      }
      if (alphabetize(potential_match) == letters_to_match) {
        anagrams.push(potential_match);
      }
    }
    return anagrams;
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
