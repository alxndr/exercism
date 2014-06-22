class Clock
  constructor: (hour, minute=0) ->
    @date = new Date(null, null, null, hour, minute)

  plus: (addMinutes) ->
    @date = new Date(Number(@date) + @MILLISEC_PER_SEC * @SEC_PER_MIN * addMinutes)
    @

  minus: (subtractMinutes) -> @plus(-1 * subtractMinutes)

  equals: (otherClock) -> @toString() == otherClock.toString()

  toString: -> "#{@zeroPad @date.getHours()}:#{@zeroPad @date.getMinutes()}"

  zeroPad: (num=0) -> ('00' + num).substr(-2, 2)

  MILLISEC_PER_SEC: 1000
  SEC_PER_MIN: 60

Clock.at = (h, m) ->
  new Clock(h, m)

module?.exports = Clock
