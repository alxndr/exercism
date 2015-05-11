defmodule SpaceAge do

  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @earth_orbital_period_in_sec 60*60*24*365.25

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(:earth, seconds) do
    seconds / @earth_orbital_period_in_sec
  end
  def age_on(planet, seconds) do
    seconds / (@earth_orbital_period_in_sec * planet_orbit_relative_to_earth(planet))
  end

  defp planet_orbit_relative_to_earth(:mercury), do: 0.2408467
  defp planet_orbit_relative_to_earth(:venus),   do: 0.6151973
  defp planet_orbit_relative_to_earth(:mars),    do: 1.8808158
  defp planet_orbit_relative_to_earth(:jupiter), do: 11.862815
  defp planet_orbit_relative_to_earth(:saturn),  do: 29.447498
  defp planet_orbit_relative_to_earth(:uranus),  do: 84.016846
  defp planet_orbit_relative_to_earth(:neptune), do: 164.79132

end
