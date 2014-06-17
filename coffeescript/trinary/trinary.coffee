class Trinary
  constructor: (num) ->
    @inDecimal = parseInt(num, 3) || 0

  toDecimal: ->
    @inDecimal


module?.exports = Trinary
