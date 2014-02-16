function word_analyzer(text) {
  var analysis, corpus;
  function scan(str, regex) {
    if (!regex.global) {
      throw "regex must have 'global' flag set";
    }
    var r = [];
    str.replace(regex, function() {
      r.push(Array.prototype.slice.call(arguments, 1, -2));
    });
    return r;
  }
  function strip_punctuation(str) {
    var scanned = scan(str, /([a-z0-9 ]+)/g);
    console.log(scanned[0]);
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
