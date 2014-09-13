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
        @palindromes[product] = @newPalindrome(product) unless @palindromes[product]
        @palindromes[product].factors.push [slowerCounter, fasterCounter]

  firstPalindrome: -> @palindromes[Object.keys(@palindromes)[0]]
  lastPalindrome: -> @palindromes[@palindromes.length - 1]

  largest: -> @lastPalindrome()
  smallest: -> @firstPalindrome()

  newPalindrome: (product) -> value: product, factors: []

isPalindrome = (str) -> str is str.split("").reverse().join("")

module?.exports = PalindromesInRange
