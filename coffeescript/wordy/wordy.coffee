NUMBER_REGEX = /\d/

class WordProblem
  constructor: (questionText) ->
    @operatorStack = []
    @tokens = @sanitize(questionText).reduce(@buildTokenArray, [])
    @parsedTokens = @tokens.reduce(@parseTokens.bind(@), [])

  answer: ->
    throw @ERROR.tooComplicated unless @parsedTokens.length == 1 and @tokens.length > 1
    @parsedTokens[0]

  sanitize: (questionText) -> questionText.replace(/\?$/,'').split(' ')

  buildTokenArray: (tokenArray, word) ->
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

  ERROR:
    tooComplicated: new Error('WordProblem: input problem is too complicated')

class Operator
  constructor: (@sym) ->

  calculate: ({left, right})->
    switch @sym
      when '+' then left + right
      when '-' then left - right
      when '*' then left * right
      when '/' then left / right
      else throw "Don't know that trick: '#{@sym}'"

module?.exports = WordProblem
