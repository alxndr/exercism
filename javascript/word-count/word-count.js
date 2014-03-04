function count_unique_elements(accumulator, element) {
  if (accumulator.hasOwnProperty(element)) {
    accumulator[element]++;
  } else {
    accumulator[element] = 1;
  }
  return accumulator;
}

function strip_punctuation(str) {
  return str.toLowerCase().replace(/[^a-z0-9 ]/g, '');
}

function word_analyzer(text) {
  return strip_punctuation(text).split(/\s+/).reduce(count_unique_elements, {});
}

if (module) {
  module.exports = word_analyzer;
}
