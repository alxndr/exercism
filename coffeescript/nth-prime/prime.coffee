PrimeFinder =
  nth: (n) ->
    new NthPrime(n).value

class NthPrime
  constructor: (nth) ->
    if nth <= 0
      throw 'Prime is not possible'
    if nth == 1
      @primes = [null, 2] # null makes this list effectively 1-indexed
      @lastNumber = 2
    else
      previousPrime = new NthPrime(nth - 1)
      @primes = previousPrime.primes
      @lastNumber = previousPrime.lastNumber
    until @primes[nth]
      @lastNumber += 1
      factorOfLastNumber = @primes.firstWhere (prime) => @lastNumber % prime == 0
      @primes.push @lastNumber unless factorOfLastNumber
    @value = @primes[nth]

Array::firstWhere = (truthFn) ->
  for elem in @
    return elem if truthFn(elem)

module?.exports = PrimeFinder
