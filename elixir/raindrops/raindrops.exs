defmodule Raindrops do

  @factor_pairs [
    "Pling": 3,
    "Plang": 5,
    "Plong": 7,
  ]

  @default ""

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    factors_string = string_for_factors(number)
    if factors_string == @default do
      to_string number
    else
      factors_string
    end
  end

  @spec string_for_factors(pos_integer) :: String.t
  defp string_for_factors(number) do
    @factor_pairs
    |> Enum.reduce(@default, fn
      ({term, n}, str) when number >= n and rem(number, n) == 0 ->
        str <> to_string(term)
      (_, str) ->
        str
    end)
  end
end
