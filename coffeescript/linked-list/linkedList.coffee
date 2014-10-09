class Deque

  # TODO collapse unshift/push

  constructor: ->
    @log ""

  count: 0
  head: null
  tail: null

  countNodes: -> @count

  deleteNode: (value) ->
    node = @findFromTail(value)
    @log "deleting", node.value
    if node.prev
      node.prev.next = node.next
    else
      @head = node.next
    if node.next
      node.next.prev = node.prev
    else
      @tail = node.prev
    @count--
    @log()
    node.value


  findFromTail: (value) ->
    @log "looking for", value
    currentNode = @tail
    while currentNode.value isnt value
      currentNode = currentNode.prev
    currentNode

  log: ->
    return
    if arguments[0]
      console.log arguments...
    else
      console.log ">>> head-to-tail:", @head?.stringTails()
      console.log ">>> tail-to-head:", @tail?.stringHeads()

  popNode: ->
    return unless @tail
    oldTail = @tail
    @log "popping off", oldTail.value
    @tail = oldTail.prev
    @tail.next = null if @tail?.next
    @count--
    @log()
    oldTail.value

  pushNode: (value) ->
    @log "pushing", value
    priorTail = @tail
    e = new Element(value: value, prev: priorTail)
    priorTail?.next = e
    @tail = e # TODO change to push onto head?
    @count++
    @head or= @tail
    @log()
    true

  shiftNode: ->
    return unless @head
    oldHead = @head
    @log "shifting off", oldHead.value
    @head = oldHead.next
    @head.prev = null if @head?.prev
    @count--
    @log()
    oldHead.value

  unshiftNode: (value) ->
    @log "prepend", value
    priorHead = @head
    e = new Element(value: value, next: priorHead)
    priorHead?.prev = e
    @head = e
    @count++
    @tail or= @head
    @log()
    true


class Element

  constructor: ({@value, @prev, @next}) ->

  stringHeads: ->
    "#{@value}, #{if @prev then @prev.stringHeads() else ""}"

  stringTails: ->
    "#{@value}, #{if @next then @next.stringTails() else ""}"

module?.exports = Deque
