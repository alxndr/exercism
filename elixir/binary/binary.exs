defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    {answer, _} =
      string
      |> String.reverse
      |> String.split("")
      |> Enum.reduce({0, 0}, fn
        ("1", {total, place}) -> {total + two_to_n(place), place + 1}
        (_, {total, place})   -> {total, place + 1}
      end)
    answer
  end

  def two_to_n(0), do: 1
  def two_to_n(n), do: 2 * two_to_n(n - 1)

end
