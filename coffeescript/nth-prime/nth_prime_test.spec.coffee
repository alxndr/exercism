Prime = require './prime'

describe 'Prime', ->

  it 'first', ->
    prime = Prime.nth(1)
    expect(prime).toEqual(2)

  it 'second', ->
    prime = Prime.nth(2)
    expect(prime).toEqual(3)

  it 'sixth', ->
    prime = Prime.nth(6)
    expect(prime).toEqual(13)

  it 'more than that', ->
    NTH_TO_VAL =
      10: 29
      50: 229
      100: 541
      500: 3571
      1000: 7919
      5000: 48611
    for nth in Object.keys(NTH_TO_VAL)
      expect(Prime.nth(nth)).toEqual(NTH_TO_VAL[nth])

  xit 'big prime', ->
    prime = Prime.nth(10001)
    expect(prime).toEqual(104743)

  xit 'bigger primes', ->
    MAPPING =
      10010: 104831
      10050: 105341
      10100: 105943
      10200: 107033
      10500: 1
    for nth in Object.keys(MAPPING)
      prime = Prime.nth(nth)
      expect(prime).toEqual(MAPPING[nth])

  it 'weird case', ->
    try
      Prime.nth(0)
    catch error
    expect(error).toEqual("Prime is not possible")
