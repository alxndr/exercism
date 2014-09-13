class Bob
  constructor: (@reactions=[SilentReaction, YellingReaction, QuestioningReaction, Reaction]) ->

  hey: (input) ->
    @respondTo new Stimulus(input)

  respondTo: (stimulus) ->
    for reaction in @reactions
      return reaction.response if reaction.test(stimulus)

class Stimulus
  constructor: (@input) ->
  isSilent: -> !!@input.match(/^\s*$/)
  isYelling: -> !@input.match(/[a-z]/)
  isQuestioning: -> !!@input.match(/\?$/)

class Reaction
  @response: 'Whatever.'
  @test: -> true

class SilentReaction
  @response: 'Fine. Be that way!'
  @test: (stimulus) -> stimulus.isSilent()

class YellingReaction
  @response: 'Woah, chill out!'
  @test: (stimulus) -> stimulus.isYelling()

class QuestioningReaction
  @response: 'Sure.'
  @test: (stimulus) -> stimulus.isQuestioning()

module.exports = Bob
