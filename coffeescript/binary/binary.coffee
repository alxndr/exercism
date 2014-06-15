class Binary
  constructor: (binaryString) ->
    @decimalInt = parseInt(binaryString, 2) or 0

  toDecimal: ->
    @decimalInt

module?.exports = Binary
