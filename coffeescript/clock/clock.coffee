class Clock
  constructor: (@hour, @minute=0) ->

  plus: (addMinutes) ->
    @minute += addMinutes
    @checkOverflow()
    @

  minus: (subtractMinutes) ->
    @minute -= subtractMinutes
    @checkOverflow()
    @

  equals: (otherClock) -> @toString() == otherClock.toString()

  toString: -> "#{zeroPad(@hour)}:#{zeroPad(@minute)}"

  checkOverflow: ->
    if @minute >= @MINS_PER_HOUR
      @hour += Math.floor(@minute / @MINS_PER_HOUR)
      @minute %= @MINS_PER_HOUR
    else if @minute < 1
      hourDeficit = Math.floor(@minute / @MINS_PER_HOUR)
      @hour += hourDeficit
      @minute += @MINS_PER_HOUR * Math.abs(hourDeficit)
    if @hour >= @HOURS_PER_DAY
      @hour %= @HOURS_PER_DAY
    else if @hour < 0
      @hour += @HOURS_PER_DAY * Math.abs(Math.floor(@hour / @MINS_PER_HOUR))

  MINS_PER_HOUR: 60
  HOURS_PER_DAY: 24

Clock.at = (h, m) ->
  new Clock(h, m)

zeroPad = (num=0) -> ('00' + num).substr(-2, 2)

module?.exports = Clock
