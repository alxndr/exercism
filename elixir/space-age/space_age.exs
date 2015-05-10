defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @earth_orbital_period_in_sec 60*60*24*365.25

  @sec_per_year_on_mercury @earth_orbital_period_in_sec * 0.2408467
  @sec_per_year_on_venus   @earth_orbital_period_in_sec * 0.6151973
  @sec_per_year_on_earth   @earth_orbital_period_in_sec
  @sec_per_year_on_mars    @earth_orbital_period_in_sec * 1.8808158
  @sec_per_year_on_jupiter @earth_orbital_period_in_sec * 11.862815
  @sec_per_year_on_saturn  @earth_orbital_period_in_sec * 29.447498
  @sec_per_year_on_uranus  @earth_orbital_period_in_sec * 84.016846
  @sec_per_year_on_neptune @earth_orbital_period_in_sec * 164.79132

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(:mercury, seconds), do: seconds / @sec_per_year_on_mercury
  def age_on(:venus, seconds),   do: seconds / @sec_per_year_on_venus
  def age_on(:earth, seconds),   do: seconds / @sec_per_year_on_earth
  def age_on(:mars, seconds),    do: seconds / @sec_per_year_on_mars
  def age_on(:jupiter, seconds), do: seconds / @sec_per_year_on_jupiter
  def age_on(:saturn, seconds),  do: seconds / @sec_per_year_on_saturn
  def age_on(:uranus, seconds),  do: seconds / @sec_per_year_on_uranus
  def age_on(:neptune, seconds), do: seconds / @sec_per_year_on_neptune

end
