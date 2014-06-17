class Hexadecimal
  constructor: (numString) ->
    @valid = true
    @decimalInt = numString.split('').reverse().reduce((acc, char, index) =>
      return 0 unless @valid
      unless @hexMapping.hasOwnProperty char
        @valid = false
        return 0
      value = @hexMapping[char]
      multiplier = Math.pow(16, index)
      acc += value * multiplier
    , 0)

  toDecimal: ->
    @decimalInt

  hexMapping:
    '0': 0
    '1': 1
    '2': 2
    '3': 3
    '4': 4
    '5': 5
    '6': 6
    '7': 7
    '8': 8
    '9': 9
    'a': 10
    'b': 11
    'c': 12
    'd': 13
    'e': 14
    'f': 15

module?.exports = Hexadecimal
