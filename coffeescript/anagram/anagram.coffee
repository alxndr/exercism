class Anagram
  constructor: (startingWord) ->
    @referenceWord = startingWord.toLowerCase()
    @referenceWordAlphabetized = @referenceWord.toAlphabetized()

  match: (potentialMatches) ->
    matches = []
    for potentialMatch in potentialMatches
      potentialMatch = potentialMatch.toLowerCase() 
      if potentialMatch.toAlphabetized() is @referenceWordAlphabetized and potentialMatch isnt @referenceWord
        matches.push potentialMatch
    matches

String::toAlphabetized = ->
  @split('').sort().join('')

module?.exports = Anagram
