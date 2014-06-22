class BeerVerse
  constructor: (@num) ->

  toString: ->
    """#{@beerOnWallPhrase(@num).capitalize()}, #{@beerPhrase(@num)}.
    #{@actionPhrase(@num)}, #{@beerOnWallPhrase(if @num then @num - 1 else 99)}.
    """

  beerOnWallPhrase: (num) ->
    "#{@beerPhrase(num)} on the wall"

  beerPhrase: (num) ->
    "#{if num == 0 then 'no more' else num} bottle#{if num != 1 then 's' else ''} of beer"

  actionPhrase: (num) ->
    switch num
      when 0 then "Go to the store and buy some more"
      when 1 then "Take it down and pass it around"
      else        "Take one down and pass it around"

BeerVerse.verse = (num) ->
  new BeerVerse(num).toString()

String::capitalize = -> @[0].toUpperCase() + @slice(1)

module?.exports = BeerVerse
