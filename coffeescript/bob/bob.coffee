class Bob
  hey: (input) ->
    stimulus = new Stimulus(input)
    if stimulus.is_silent()
      return 'Fine. Be that way!'
    if stimulus.is_shouting()
      return 'Woah, chill out!'
    if stimulus.is_questioning()
      return 'Sure.'
    return 'Whatever.'

class Stimulus
  constructor: (input) ->
    @shouting = !input.match(/[a-z]/)
    @questioning = !!input.match(/\?$/)
    @silent = !!input.match(/^\s*$/)

  is_shouting: -> @shouting
  is_questioning: -> @questioning
  is_silent: -> @silent

module.exports = Bob
