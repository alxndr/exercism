PrimeFinder =
  nth: (n) ->
    new NthPrime(n).value

class NthPrime
  constructor: (nth) ->
    if nth <= 0
      throw 'Prime is not possible'
    if nth == 1
      @value = 2
      @primes = [2]
      @lastNumber = 2
    else
      previousPrime = new NthPrime(n - 1)
      @primes = previousPrime.primes
      @lastNumber = previousPrime.lastNumber
      # ...now what

module?.exports = PrimeFinder

#[2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25...]
# ^--- prime
#[   3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25...]
#
#[3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25...]
#    ^-    ^-    ^-    ^^--    ^^--    ^^--    ^^--    ^^--    ^^--    ^^--    ^^--- remove multiples
#[3,    5,    7,    9,     11,     13,     15,     17,     19,     21,     23,     25...]
#
#[3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25...]
# ^--- next prime
#[   5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25...]
#
#[5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25...]
#       ^          ^^          ^^-- remove multiples
#
#really this is having an infinite list that you're looking throuh, and keeping
#track of the primes you've already found, and using the list of primes as the factors to try
#dividing the next thing in the infinite list.
#
