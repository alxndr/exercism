function count_unique_elements(accumulator, element) {
  if (accumulator.hasOwnProperty(element)) {
    accumulator[element]++;
  } else {
    accumulator[element] = 1;
  }
  return accumulator;
}

var REGEX_PUNCTUATION = /[\u00A1\u00BF\u2000-\u206F\u2E00-\u2E7F\\'!"#\$%&\(\)\*\+,\-\.\/:;<=>\?@\[\]\^_`\{\|\}~]/g;

function strip_punctuation(str) {
  return str.replace(REGEX_PUNCTUATION, '').toLowerCase();
}

function word_analyzer(text) {
  return strip_punctuation(text).split(/\s+/).reduce(count_unique_elements, {});
}

if (module) {
  module.exports = word_analyzer;
}
