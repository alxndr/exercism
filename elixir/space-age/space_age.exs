defmodule SpaceAgeMacros do
  defmacro def_age_on(planet, opts \\ []) do
    quote do
      @doc """
      Return the number of years a person that has lived for 'seconds' seconds is
      aged on 'planet'.
      """
      @spec age_on(planet, pos_integer) :: float
      def age_on(unquote(planet), seconds) do
        seconds / (@earth_orbital_period_in_sec * unquote(opts[:multiplier]))
      end
    end
  end
end

defmodule SpaceAge do
  require SpaceAgeMacros

  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @earth_orbital_period_in_sec 60*60*24*365.25

  SpaceAgeMacros.def_age_on :mercury, multiplier: 0.2408467
  SpaceAgeMacros.def_age_on :venus,   multiplier: 0.6151973
  SpaceAgeMacros.def_age_on :earth,   multiplier: 1
  SpaceAgeMacros.def_age_on :mars,    multiplier: 1.8808158
  SpaceAgeMacros.def_age_on :jupiter, multiplier: 11.862815
  SpaceAgeMacros.def_age_on :saturn,  multiplier: 29.447498
  SpaceAgeMacros.def_age_on :uranus,  multiplier: 84.016846
  SpaceAgeMacros.def_age_on :neptune, multiplier: 164.79132

end
