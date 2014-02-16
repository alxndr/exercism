class Gigasecond

  def initialize(start_date)
    @starting_time = start_date.to_time
  end

  def date
    (@starting_time + 10**9).to_date
  end

end
