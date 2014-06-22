class AtbashCipher
  constructor: (@inputString) ->
    encodedLetters = @sanitize(inputString).map(@encodeLetter)
    @encodedString = @chunkIntoFives(encodedLetters)

  sanitize: (inputString) ->
    inputString.toLowerCase().replace(/[^a-z\d]/g, '').split('')

  encodeLetter: (letter) ->
    return letter if letter == Number(letter).toString()
    asciiVal = letter.charCodeAt()
    withinRange = asciiVal - 97
    String.fromCharCode(122 - withinRange)

  chunkIntoFives: (letters) ->
    letters.reduce((chunks, letter) ->
      lastChunk = chunks.pop()
      if lastChunk?.length < 5
        lastChunk += letter
        chunks.push lastChunk
      else
        chunks.push lastChunk if lastChunk?
        chunks.push letter
      chunks
    , []).join(' ')

  encode: -> @encodedString

AtbashCipher.encode = (string) ->
  new AtbashCipher(string).encode()

module?.exports = AtbashCipher
