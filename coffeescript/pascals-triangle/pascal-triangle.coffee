class PascalsTriangle

  array: [[1]]

  constructor: (height) ->
    @nthRow(height)

  nthRow: (n) -> # 1-indexed
    if n <= 1
      [1]
    else
      @array[n-1] = [0, @nthRow(n-1)..., 0].reduce(@reduceToNthRow, [])

  reduceToNthRow: (newRow, currentValue, index, zeroPaddedPriorArray) ->
    if index is zeroPaddedPriorArray.length - 1
      # at the last zero-pad, don't push another value onto new row
      return newRow
    newRow.push currentValue + zeroPaddedPriorArray[index + 1]
    newRow


module?.exports = PascalsTriangle
