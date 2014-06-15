class Words
  constructor: (string) ->
    string = @sanitize(string)
    @count = @count_unique(string.split(' '))

  count_unique: (words) ->
    words.reduce(@unique_word_reducer, {})

  sanitize: (s) ->
    s.toLowerCase().replace(/[^a-z0-9 ]/g, '').replace(/\s+/g, ' ')

  unique_word_reducer: (counts, word) ->
    if counts[word]
      counts[word] += 1
    else
      counts[word] = 1
    counts


module?.exports = Words
