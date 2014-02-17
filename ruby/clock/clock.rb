class Clock

  def initialize(time)
    @time = time
  end

  def hour
    @time.hour
  end

  def minute
    @time.min
  end

  def to_s
    "%02d:%02d" % [ hour, minute ]
  end

  def +(sec)
    self.class.new(@time + sec * 60)
  end

  def -(sec)
    self + (sec * -1)
  end

  def ==(clock)
    to_s == clock.to_s
  end

  def self.at(h, m=0)
    Clock.new(Time.new 0, 1, 1, h, m)
  end

end

