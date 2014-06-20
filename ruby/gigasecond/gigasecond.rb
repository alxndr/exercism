class Gigasecond

  BILLION = 10**9

  attr_reader :date

  def initialize(start_date)
    @starting_time = start_date.to_time
    @date = (@starting_time + BILLION).to_date
  end

end
