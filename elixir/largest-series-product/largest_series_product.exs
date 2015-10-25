defmodule Series do

  @doc """
  Splits up the given string of numbers into an array of integers.
  """
  @spec digits(String.t) :: [non_neg_integer]
  def digits(number_string) do
    number_string
    |> String.graphemes
    |> Enum.map(&string_to_integer/1)
  end

  defp string_to_integer("0"), do: 0
  defp string_to_integer("1"), do: 1
  defp string_to_integer("2"), do: 2
  defp string_to_integer("3"), do: 3
  defp string_to_integer("4"), do: 4
  defp string_to_integer("5"), do: 5
  defp string_to_integer("6"), do: 6
  defp string_to_integer("7"), do: 7
  defp string_to_integer("8"), do: 8
  defp string_to_integer("9"), do: 9


  @doc """
  Generates sublists of a given size from a given string of numbers.
  """
  @spec slices(String.t, non_neg_integer) :: [list(non_neg_integer)]
  def slices(number_string, size) do
    number_string
    |> digits
    |> Enum.reduce({[], []}, fn (n, {slices, slice}) ->
      shifted_slice = shift_slice(slice, n, size)
      if Enum.count(shifted_slice) < size do
        {slices, shifted_slice}
      else
        {slices ++ [shifted_slice], shifted_slice}
      end
    end)
    |> unwrap_slices
  end

  defp shift_slice(slice, n, limit) when length(slice) < limit, do: slice ++ [n]
  defp shift_slice([_ | slice_base], n, _limit), do: slice_base ++ [n]

  defp unwrap_slices({slices, _}), do: slices


  @doc """
  Finds the largest product of a given number of consecutive numbers in a given string of numbers.
  """
  @spec largest_product(String.t, non_neg_integer) :: non_neg_integer
  def largest_product(_, 0), do: 1
  def largest_product(number_string, size) do
    number_string
    |> slices(size)
    |> Enum.map(&multiply(&1))
    |> find_max
  end

  defp multiply(numbers), do: Enum.reduce(numbers, &(&1 * &2))

  defp find_max(numbers) do
    numbers
    |> Enum.reduce(0, fn (n, max) ->
      if n > max do
        n
      else
        max
      end
    end)
  end
end
