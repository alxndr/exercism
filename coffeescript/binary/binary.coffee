class Binary
  constructor: (binaryString) ->
    @decimalInt = binaryString.replace(/[^01]/g,'').split('').reverse().reduce((acc, char, index) =>
      value = if char == '0' then 0 else 1
      multiplier = Math.pow 2, index
      acc += value * multiplier
    , 0)

  toDecimal: ->
    @decimalInt

module?.exports = Binary
