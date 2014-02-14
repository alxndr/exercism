function words(text) {
  function strip_punctuation(t) {
    return t.replace(/[^a-z0-9 ]/g, '');
  }
  var analysis = { },
    corpus = strip_punctuation(text.toLowerCase()).split(/\s+/);

  for (var i in corpus) {
    if (corpus.hasOwnProperty(i)) {
      var word = corpus[i];
      if (!analysis[word]) {
        analysis[word] = 0;
      }
      analysis[word]++;
    }
  }
  return analysis;
}

if (module) {
  module.exports = words;
}
