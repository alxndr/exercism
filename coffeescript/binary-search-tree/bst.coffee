class BinarySearchTree
  constructor: (@data) ->

  insert: (num) ->
    leafName = if num > @data then 'right' else 'left'
    if @[leafName]
      @[leafName].insert num
    else
      @[leafName] = new BinarySearchTree(num)

  each: (cb) ->
    @left.each cb if @left
    cb @data
    @right.each cb if @right

module?.exports = BinarySearchTree
