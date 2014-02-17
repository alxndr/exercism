class SpaceAge

  attr_accessor :seconds

  EARTH_ORBITAL_PERIOD_IN_SECONDS = 86_400 * 365.25
  ORBITAL_PERIODS = {
    earth:   EARTH_ORBITAL_PERIOD_IN_SECONDS,
    mercury: EARTH_ORBITAL_PERIOD_IN_SECONDS * 0.2408467,
    venus:   EARTH_ORBITAL_PERIOD_IN_SECONDS * 0.61519726,
    mars:    EARTH_ORBITAL_PERIOD_IN_SECONDS * 1.8808158,
    jupiter: EARTH_ORBITAL_PERIOD_IN_SECONDS * 11.862615,
    saturn:  EARTH_ORBITAL_PERIOD_IN_SECONDS * 29.447498,
    uranus:  EARTH_ORBITAL_PERIOD_IN_SECONDS * 84.016846,
    neptune: EARTH_ORBITAL_PERIOD_IN_SECONDS * 164.79132,
  }

  def initialize(seconds)
    @seconds = seconds
  end

  ORBITAL_PERIODS.each do |planet, orbital_period|
    define_method("on_#{planet.to_s}") do
      ( @seconds / orbital_period ).round 2
    end
  end

end
