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
    switch @sym
      when '+' then left + right
      when '-' then left - right
      when '*' then left * right
      when '/' then left / right
      else throw "Don't know that trick: '#{@sym}'"

class WordProblem
  ERROR: tooComplicated: new Error('WordProblem: input problem is too complicated')

  constructor: (questionText) ->
    @operatorStack = []
    @lexed = @sanitize(questionText).reduce(@lexer, [])
    @operandStack = @lexed.reduce(@parseTokens.bind(@), [])

  answer: ->
    throw @ERROR.tooComplicated unless @lexed.length > 1
    @operandStack[0]

  sanitize: (questionText) -> questionText.replace(/\?$/,'').split(' ')

  parseTokens: (operandStack, token) ->
    if token == Number(token)
      operandStack.push token
      operandStack.push @performOperation(operandStack) if operandStack.length > 1 and @operatorStack.length
    else
      @operatorStack.push new Operator(token)
    operandStack

  performOperation: (operandStack) ->
    # all operands are binary
    rightOperand = operandStack.pop()
    leftOperand = operandStack.pop()
    @operatorStack.pop().calculate(left: leftOperand, right: rightOperand)

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
