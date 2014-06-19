SEARCH_SPACE_MULTIPLIER = 10.5

PrimeFinder =
  nth: (n) ->
    new Sieve(n * SEARCH_SPACE_MULTIPLIER).primes[n-1]

class Sieve
  constructor: (max) ->
    throw 'Prime is not possible' unless max > 0
    primesSearchSpace = range(2, max)
    factorsSearchSpace = range(2, Math.sqrt(max) + 1)
    for factor in factorsSearchSpace
      continue if factor % 2 is 0 and factor > 2
      continue if factor % 3 is 0 and factor > 3
      continue if factor % 5 is 0 and factor > 5
      for potentialPrime, index in primesSearchSpace
        if potentialPrime % factor is 0 and potentialPrime isnt factor
          primesSearchSpace.removeAt index
    @primes = primesSearchSpace

Array::removeAt = (n) -> @splice(n, 1)

range = (start, stop) -> # a distilled version of underscore's _.range()
  length = Math.max(Math.ceil(stop - start), 0)
  index = 0
  r = new Array(length)
  while index < length
    r[index++] = start
    start += 1
  r

module?.exports = PrimeFinder

