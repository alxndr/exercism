class Queen
  constructor: (@row, @column) ->

  sameCell: (queen) -> @row == queen.row and @column == queen.column

  withinRange: (queen) -> @row == queen.row or @column == queen.column or Math.abs(@row - @column) == Math.abs(queen.row - queen.column)

class QueensOnBoard
  constructor: (config) ->
    @black = config?.black or [7, 3]
    @white = config?.white or [0, 3]
    @blackQueen = new Queen(@black...)
    @whiteQueen = new Queen(@white...)
    throw 'Queens cannot share the same space' if @whiteQueen.sameCell(@blackQueen)

  canAttack: -> @whiteQueen.withinRange @blackQueen

  toString: ->
    @columns().reduce((columns, column) =>
      columns.push @rows(column).map((row) =>
        @cellToString(row: row, column: column)
      ).join ' '
      columns
    , []).join '\n'

  cellToString: ({column, row}) ->
    if @blackQueen.row == row and @blackQueen.column == column
      'B'
    else if @whiteQueen.row == row and @whiteQueen.column == column
      'W'
    else
      'O'

  rows: -> [0..7]
  columns: -> [0..7]

module?.exports = QueensOnBoard
