function word_analyzer(text) {
  var analysis, corpus;
  function strip_punctuation(str) {
    return str.replace(/[^a-z0-9 ]/g, '');
  }
  function analyze(accumulator, element) {
    if (!accumulator.hasOwnProperty(element)) {
      accumulator[element] = 1;
    } else {
      accumulator[element]++;
    }
    return accumulator;
  }

  corpus = strip_punctuation(text.toLowerCase()).split(/\s+/);

  return corpus.reduce(analyze, {});
}

if (module) {
  module.exports = word_analyzer;
}
