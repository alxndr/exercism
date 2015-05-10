defmodule SpaceAgeMacros do

  defmacro __using__(_options) do
    quote do
      import unquote(__MODULE__)
    end
  end

  defmacro def_age_on(planet, opts) do
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
  use SpaceAgeMacros

  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @earth_orbital_period_in_sec 60*60*24*365.25

  def_age_on :mercury, multiplier: 0.2408467
  def_age_on :venus,   multiplier: 0.6151973
  def_age_on :earth,   multiplier: 1
  def_age_on :mars,    multiplier: 1.8808158
  def_age_on :jupiter, multiplier: 11.862815
  def_age_on :saturn,  multiplier: 29.447498
  def_age_on :uranus,  multiplier: 84.016846
  def_age_on :neptune, multiplier: 164.79132

end
