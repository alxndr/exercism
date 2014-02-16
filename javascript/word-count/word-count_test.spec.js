var words = require('./word-count');

describe("words()", function() {
  it("counts one word", function() {
    var expectedCounts = { "word" : 1 };
    expect(words("word")).toEqual(expectedCounts);
  });

  it("counts one of each", function() {
    var expectedCounts = { "one": 1, "of": 1, "each": 1 };
    expect(words("one of each")).toEqual(expectedCounts);
  });

  it("counts multiple occurrences", function() {
    var expectedCounts = { "one" : 1, "fish" : 4, "two" : 1, "red" : 1, "blue" : 1 };
    expect(words("one fish two fish red fish blue fish")).toEqual(expectedCounts);
  });

  it("ignores punctuation", function() {
    var expectedCounts = { "car" : 1, "carpet" : 1, "as" : 1, "java" : 1, "javascript" : 1 };
    expect(words("car : carpet as java : javascript!!&@$%^&")).toEqual(expectedCounts);
  });

  it("includes numbers", function() {
    var expectedCounts = { "testing" : 2, "1" : 1, "2" : 1 };
    expect(words("testing, 1, 2 testing")).toEqual(expectedCounts);
  });

  it("normalizes case", function() {
    var expectedCounts = { "go" : 3 };
    expect(words("go Go GO")).toEqual(expectedCounts);
  });

  it("handles unicode", function() {
    var expectedCounts = {
      "du": 2,
      "skal": 1,
      "kravle": 1,
      "før": 1,
      "kan": 1,
      "gå": 1
    };
    // Danish: "You have to learn to crawl before you can walk"
    // e.g. "Learn to walk before you can run"
    // http://en.wikiquote.org/wiki/Danish_proverbs#D
    expect(words("Du skal kravle, før du kan gå")).toEqual(expectedCounts);
  });

  it("handles big unicode", function() {
    var expectedCounts = {
      "今": 2,
      "日": 2,
      "事": 1,
      "畢": 1
    };
    expect(words("今日事，今日畢")).toEqual(expectedCounts);
  });
});
