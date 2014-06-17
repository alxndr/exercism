class LuhnChecker
  constructor: (num) ->
    @checkDigit = num % 10
    numBackwardsArray = num.toString().split('').reverse().map (n) -> Number(n)
    intermediateArray = numBackwardsArray.map (n, index) ->
      if index % 2
        n *= 2
        n -= 9 if n > 9
      n
    @addends = intermediateArray
    @checksum = intermediateArray.reduce((acc, n) ->
      acc += n
    , 0)
    @valid = @checksum % 10 == 0

LuhnChecker.create = (num) ->
  num_x10 = num * 10
  lc = new LuhnChecker(num_x10)
  if lc.valid
    num_x10
  else
    num_x10 + 10 - (lc.checksum % 10)

module?.exports = LuhnChecker
