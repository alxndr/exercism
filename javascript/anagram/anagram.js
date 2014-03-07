function alphabetize(letters) {
  return letters.toLowerCase().split('').sort().join('');
}

function find_anagrams_of(first_word) {
  first_word = first_word.toLowerCase();
  return function keep_matches(second_word) {
    second_word = second_word.toLowerCase();
    return (alphabetize(first_word) === alphabetize(second_word) && first_word !== second_word);
  };
}

function Anagram(first_word) {
  function match(potential_anagrams) {
    return potential_anagrams.filter(find_anagrams_of(first_word));
  }

  this.match = match;
}

if (module) {
  module.exports = Anagram;
}
