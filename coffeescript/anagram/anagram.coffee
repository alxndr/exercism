class Anagram
  constructor: (startingWord) ->
    @referenceWord = startingWord.toLowerCase()
    @referenceWordAlphabetized = @referenceWord.toAlphabetized()

  match: (potentialMatches) ->
    potentialMatch.toLowerCase() for potentialMatch in potentialMatches \
      when potentialMatch.toLowerCase().toAlphabetized() is @referenceWordAlphabetized \
        and potentialMatch.toLowerCase() isnt @referenceWord

String::toAlphabetized = ->
  @split('').sort().join('')

module?.exports = Anagram
