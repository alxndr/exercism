var REGEX_PUNCTUATION = /[\u00A1\u00BF\u2000-\u206F\u2E00-\u2E7F\\'!"#\$%&\(\)\*\+,\-\.\/:;<=>\?@\[\]\^_`\{\|\}~]/g;

function countUniqueElements(sums, word) {
  if (sums.hasOwnProperty(word)) {
    sums[word]++;
  } else {
    sums[word] = 1;
  }
  return sums;
}

function stripPunctuation(str) {
  return str.replace(REGEX_PUNCTUATION, '');
}

function wordAnalyzer(text) {
  return stripPunctuation(text).toLowerCase().split(/\s+/).reduce(countUniqueElements, {});
}

if (module) {
  module.exports = wordAnalyzer;
}
