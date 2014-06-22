class Queen
  constructor: (@row, @column) ->

  sameCell: (queen) ->
    @row == queen.row and @column == queen.column

  withinRange: (queen) ->
    @row == queen.row or @column == queen.column \
      or Math.abs(@row - @column) == Math.abs(queen.row - queen.column)

class Queens
  constructor: (config) ->
    @white = config?.white or [0, 3]
    @black = config?.black or [7, 3]
    @whiteQueen = new Queen(@white...)
    @blackQueen = new Queen(@black...)
    throw 'Queens cannot share the same space' if @whiteQueen.sameCell(@blackQueen)

  canAttack: ->
    @whiteQueen.withinRange @blackQueen

  toString: ->
    #rows.toString().join('\i')
    n = 7
    rows = []
    for i in [0..n]
      cells = []
      for j in [0..n]
        if @white[0] == j and @white[1] == i
          cells.push 'W'
        else if @black[0] == j and @black[1] == i
          cells.push 'B'
        else
          cells.push 'O'
      rows.push cells.join(' ')
    rows.join '\n'

module?.exports = Queens
