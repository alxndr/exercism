Array::accumulate = (accumulator) ->
  @map (elem) -> accumulator(elem)
