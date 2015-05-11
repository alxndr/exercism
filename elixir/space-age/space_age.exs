defmodule SpaceAgeMacros do

  defmacro __using__(_options) do
    quote do
      import unquote(__MODULE__)
    end
  end

  defmacro def_ages_on(planets) do
    Enum.map(planets, fn ({planet, multiplier}) ->
      quote do
        def age_on(unquote(planet), seconds) do
          seconds / (@earth_orbital_period_in_sec * unquote(multiplier))
        end
      end
    end)
  end
end

defmodule SpaceAge do
  use SpaceAgeMacros

  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @earth_orbital_period_in_sec 60*60*24*365.25

  def_ages_on(
    mercury: 0.2408467,
    venus: 0.6151973,
    earth: 1,
    mars: 1.8808158,
    jupiter: 11.862815,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  )

end
