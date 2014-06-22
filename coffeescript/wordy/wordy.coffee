NUMBER_REGEX = /\d/

Array::tap = (callback) ->
  @forEach (element) -> callback element
  @
Array::logEach = (msg='') -> @tap (element) -> console.log(msg, element)
Array::logEm = (msg='') ->
  console.log msg, @
  @

class Operator
  constructor: (@sym) ->

  calculate: ({left, right})->
    console.log "calculating #{left} #{@sym} #{right}"
    switch @sym
      when '+' then left + right
      when '-' then left - right
      when '*' then left * right
      when '/' then left / right
      else throw "Don't know that trick: '#{@sym}'"

class WordProblem
  constructor: (question) ->
    @operatorStack = []
    console.log "operatorStack: #{@operatorStack}"
    @lexed = @sanitize(question).reduce(@lexer, [])#.logEach('lexed')
    @answer = @lexed.logEm('about to reduce->calculate').reduce(@calculate, []).logEach('calculated')

  sanitize: (questionText) -> questionText.replace(/\?$/,'').split(' ')

  calculate: (operandStack, token) ->
    console.log "operands:#{operandStack}"
    console.log "operatorStack: #{@operatorStack}"
    if token == Number(token)
      console.log "number: #{token}"
      operandStack.push token
      if operandStack.length > 1 and @operatorStack.length
        # all operands are binary
        leftOperand = operandStack.pop()
        operator = @operatorStack.pop()
        result = operator.calculate(left: leftOperand, right: token)
        console.log "#{leftOperand} #{operator} #{token}: #{result}"
        operandStack.push result
        console.log "maybe explicitly call calculate()?"
        @calculate.apply @, [operandStack, result]
    else
      console.log "operator #{token}"
      @operatorStack.push new Operator(token)
    console.log operandStack
    operandStack

  lexer: (tokenArray, word) ->
    if word.match NUMBER_REGEX
      tokenArray.push parseInt(word, 10)
    else if word is 'plus'
      tokenArray.push '+'
    else if word is 'minus'
      tokenArray.push '-'
    else if word is 'multiplied'
      tokenArray.push '*'
    else if word is 'divided'
      tokenArray.push '/'
    tokenArray

module?.exports = WordProblem
