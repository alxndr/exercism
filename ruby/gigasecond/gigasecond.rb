class Gigasecond

  SECONDS_PER_GS = 10**9

  attr_reader :date

  def initialize(start_date)
    @start_date = start_date
  end

  def date
    @gigasec_from_start_time ||= calculate_gigasec_from_start_time
  end

  private

  def calculate_gigasec_from_start_time
    (@start_date.to_time + SECONDS_PER_GS).to_date
  end

end
