Atbash = require './atbash'

describe 'Atbash', ->
  it 'encodes no', ->
    expect(Atbash.encode('no')).toBe 'ml'

  it 'encodes yes', ->
    expect(Atbash.encode('yes')).toBe 'bvh'

  it 'encodes OMG', ->
    expect(Atbash.encode('OMG')).toBe 'lnt'

  it 'encodes O M G', ->
    expect(Atbash.encode('O M G')).toBe 'lnt'

  it 'encodes a long word', ->
    expect(Atbash.encode('mindblowingly')).toBe 'nrmwy oldrm tob'

  it 'encodes numbers', ->
    expect(Atbash.encode('Testing, 1 2 3, testing.')).toBe 'gvhgr mt123 gvhgr mt'

  it 'encodes sentence', ->
    expect(Atbash.encode('Truth is fiction.')).toBe 'gifgs rhurx grlm'

  it 'encodes all the things', ->
    expect(Atbash.encode('The quick brown fox jumps over the lazy dog.')).toBe 'gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt'
