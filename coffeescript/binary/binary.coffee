class Binary
  constructor: (binaryString) ->
    @decimalInt = binaryString.replace(/[^01]/g,'').split('').reverse().reduce((acc, char, index) =>
      value = @hexCharToDecimal[char]
      multiplier = Math.pow 2, index
      acc += value * multiplier
    , 0)

  toDecimal: ->
    @decimalInt

  hexCharToDecimal:
    '0': 0
    '1': 1

module?.exports = Binary
