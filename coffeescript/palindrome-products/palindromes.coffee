class PalindromesInRange
  constructor: (config) ->
    @minFactor = config.minFactor or 1
    @maxFactor = config.maxFactor or 1
    @palindromes =
      largest:
        value: null
        factors: []
      smallest:
        value: null
        factors: []

  generate: ->
    for slowerCounter in [@minFactor..@maxFactor]
      for fasterCounter in [slowerCounter..@maxFactor]
        pp = new PotentialPalindrome(slowerCounter, fasterCounter)
        if pp.isPalindrome
          if pp.multiple > @palindromes.largest.value
            @reset 'largest', pp.multiple, pp.factors
          else if pp.multiple == @palindromes.largest.value
            @add 'largest', pp.factors
          if pp.multiple == @palindromes.smallest.value
            @add 'smallest', pp.factors
          else if pp.multiple < @palindromes.smallest.value or !@palindromes.smallest.factors.length
            @reset 'smallest', pp.multiple, pp.factors

  largest: -> @palindromes.largest

  smallest: -> @palindromes.smallest

  reset: (which, multiple, factors) ->
    @palindromes[which].value = multiple
    @palindromes[which].factors = [factors]

  add: (which, factors) ->
    @palindromes[which].factors.push factors

class PotentialPalindrome
  constructor: (@a, @b) ->
    @multiple = @a * @b
    @isPalindrome = isPalindrome(@multiple.toString())
    @factors = [@a, @b]

isPalindrome = (str) ->
  str is str.split("").reverse().join("")

module?.exports = PalindromesInRange
