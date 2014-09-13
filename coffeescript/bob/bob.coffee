class Bob

  constructor: (@reactions=[SilentReaction, YellingReaction, QuestioningReaction, Reaction]) ->

  hey: (input) -> @respondTo new Stimulus(input)

  respondTo: (stimulus) ->
    for ReactionClass in @reactions
      reaction = new ReactionClass()
      return reaction.response if reaction.isAppropriateFor stimulus

class Stimulus
  constructor: (@input) ->
  isSilent: -> /^\s*$/.test(@input)
  isYelling: -> !/[a-z]/.test(@input)
  isQuestioning: -> /\?$/.test(@input)

class Reaction
  response: 'Whatever.'
  isAppropriateFor: -> true

class SilentReaction
  response: 'Fine. Be that way!'
  isAppropriateFor: (stimulus) -> stimulus.isSilent()

class YellingReaction
  response: 'Woah, chill out!'
  isAppropriateFor: (stimulus) -> stimulus.isYelling()

class QuestioningReaction
  response: 'Sure.'
  isAppropriateFor: (stimulus) -> stimulus.isQuestioning()

module.exports = Bob
