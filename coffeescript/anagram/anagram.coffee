class Anagram
  constructor: (startingWord) ->
    @referenceWord = startingWord.toLowerCase()
    @referenceWordAlphabetized = @referenceWord.toAlphabetized()

  match: (potentialMatches) ->
    potentialMatches.reduce @findMatchesReducer.bind(@), []

  findMatchesReducer: (matches, potentialMatch) ->
    potentialMatch = potentialMatch.toLowerCase()
    matches.push potentialMatch if potentialMatch.toAlphabetized() is @referenceWordAlphabetized and potentialMatch isnt @referenceWord
    matches

String::toAlphabetized = ->
  @split('').sort().join('')

module?.exports = Anagram
