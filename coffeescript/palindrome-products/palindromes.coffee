class PalindromesInRange
  constructor: ({@minFactor, @maxFactor}) ->
    @minFactor or= 1
    @maxFactor or= 1
    @palindromes = []

  generate: ->
    for slowerCounter in [@minFactor..@maxFactor]
      for fasterCounter in [slowerCounter..@maxFactor]
        product = slowerCounter * fasterCounter
        continue unless isPalindrome product.toString()
        @palindromes[product] = value: product, factors: [] unless @palindromes[product]
        @palindromes[product].factors.push [slowerCounter, fasterCounter]

  largest: -> @palindromes[@palindromes.length - 1]

  smallest: -> return palindrome for palindrome in @palindromes when palindrome

class Palindrome
  constructor: (@a, @b) ->
    @multiple = @a * @b
    @factors = [@a, @b]

isPalindrome = (str) -> str is str.split("").reverse().join("")

module?.exports = PalindromesInRange
