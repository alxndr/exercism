class Triangle
  constructor: (a,b,c) ->
    throw 'negative sides are illegal' if a <= 0 \
                                       or b <= 0 \
                                       or c <= 0
    throw 'violation of triangle inequality' if a + b <= c \
                                             or b + c <= a \
                                             or c + a <= b
    @triangleType = if a == b == c
      'equilateral'
    else if a == b or b == c or c == a
      'isosceles'
    else
      'scalene'

  kind: -> @triangleType


module?.exports = Triangle
