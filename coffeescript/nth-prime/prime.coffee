PrimeFinder =
  nth: (n) ->
    new Sieve(n * 10.5).primes[n-1]

class Sieve
  constructor: (max) ->
    throw 'Prime is not possible' unless max > 0
    primesSearchSpace = range(2, max)
    factorsSearchSpace = range(2, Math.sqrt(max) + 1)
    for factor in factorsSearchSpace
      for potentialPrime, index in primesSearchSpace
        if potentialPrime % factor == 0 && potentialPrime != factor
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

