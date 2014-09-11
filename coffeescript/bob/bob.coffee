class Bob
  constructor: (@reactions=[SilentReaction, YellingReaction, QuestioningReaction, Reaction]) ->

  hey: (input) ->
    @respond_to new Stimulus(input)

  respond_to: (stimulus) ->
    return reaction.response() \
      for reaction in @reactions \
      when reaction.test_fn(stimulus)

class Stimulus
  constructor: (@input) ->
  is_silent: -> !!@input.match(/^\s*$/)
  is_yelling: -> !@input.match(/[a-z]/)
  is_questioning: -> !!@input.match(/\?$/)

class Reaction
  @response: -> 'Whatever.'
  @test_fn: -> true

class SilentReaction
  @response: -> 'Fine. Be that way!'
  @test_fn: (stimulus) -> stimulus.is_silent()

class YellingReaction
  @response: -> 'Woah, chill out!'
  @test_fn: (stimulus) -> stimulus.is_yelling()

class QuestioningReaction
  @response: -> 'Sure.'
  @test_fn: (stimulus) -> stimulus.is_questioning()

module.exports = Bob
