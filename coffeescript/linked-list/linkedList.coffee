class Deque

  count: 0
  head: null
  tail: null

  countNodes: -> @count

  deleteNode: (value) ->
    node = @findFromTail(value)
    if node.prev
      node.prev.next = node.next
    else
      @head = node.next
    if node.next
      node.next.prev = node.prev
    else
      @tail = node.prev
    @count--
    node.value

  findFromTail: (value) ->
    currentNode = @tail
    while currentNode.value isnt value
      currentNode = currentNode.prev
    currentNode

  popNode: ->
    return unless @tail
    oldTail = @tail
    @tail = oldTail.prev
    @tail.next = null if @tail?.next
    @count--
    oldTail.value

  pushNode: (value) ->
    priorTail = @tail
    newNode = new Element(value: value, prev: priorTail)
    priorTail?.next = newNode
    @tail = newNode
    @count++
    @head or= @tail
    null

  shiftNode: ->
    return unless @head
    oldHead = @head
    @head = oldHead.next
    @head.prev = null if @head?.prev
    @count--
    oldHead.value

  unshiftNode: (value) ->
    priorHead = @head
    newNode = new Element(value: value, next: priorHead)
    priorHead?.prev = newNode
    @head = newNode
    @count++
    @tail or= @head
    null


class Element

  constructor: ({@value, @prev, @next}) ->


module?.exports = Deque
