class Bob
  constructor: (@reactions=[SilentReaction, YellingReaction, QuestioningReaction, Reaction]) ->

  hey: (input) ->
    @respond_to new Stimulus(input)

  respond_to: (stimulus) ->
    for reaction in @reactions
      return reaction.response() if reaction.test_fn(stimulus)

class Stimulus
  constructor: (@input) ->
  is_silent: -> !!@input.match(/^\s*$/)
  is_yelling: -> !@input.match(/[a-z]/)
  is_questioning: -> !!@input.match(/\?$/)

class Reaction
  @response: -> 'Whatever.'
  @test_fn: -> true

class SilentReaction extends Reaction
  @response: -> 'Fine. Be that way!'
  @test_fn: (stimulus) -> stimulus.is_silent()

class YellingReaction extends Reaction
  @response: -> 'Woah, chill out!'
  @test_fn: (stimulus) -> stimulus.is_yelling()

class QuestioningReaction extends Reaction
  @response: -> 'Sure.'
  @test_fn: (stimulus) -> stimulus.is_questioning()

module.exports = Bob
