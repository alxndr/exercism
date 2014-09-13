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

class Bob

  DEFAULT_REACTIONS: [SilentReaction, YellingReaction, QuestioningReaction, Reaction]

  constructor: (@reactions=Bob::DEFAULT_REACTIONS) ->

  hey: (input) -> @respondTo new Stimulus(input)

  respondTo: (stimulus) ->
    for ReactionClass in @reactions
      reaction = new ReactionClass()
      return reaction.response if reaction.isAppropriateFor stimulus


module.exports = Bob
