function alphabetize(word) {
  return word.toLowerCase().split('').sort().join('');
}

function Anagram(startingWord) {
  var alphabetizedStartingWord;

  startingWord = startingWord.toLowerCase();
  alphabetizedStartingWord = alphabetize(startingWord);

  function isAnAnagram(otherWord) {
    otherWord = otherWord.toLowerCase();
    return (startingWord !== otherWord && alphabetizedStartingWord === alphabetize(otherWord));
  }
  function findMatchesAmong(potentialAnagrams) {
    if (typeof potentialAnagrams === 'string') {
      potentialAnagrams = [].slice.apply(arguments);
    }
    return potentialAnagrams.filter(isAnAnagram);
  }

  return {
    matches: findMatchesAmong
  };
}

if (module) {
  module.exports = Anagram;
}
