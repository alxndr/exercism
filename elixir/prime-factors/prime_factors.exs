defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest. 
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(1), do: []
  def factors_for(2), do: [2]
  def factors_for(3), do: [3]
  def factors_for(n), do: do_something_with(n, 2, div(n, 2))

  defp do_something_with(_, _, 0), do: []
  defp do_something_with(n, _, 1), do: n
  defp do_something_with(n, factor, _) when rem(n, factor) == 0 do
    [factor | factors_for(div(n, factor))]
  end
  defp do_something_with(n, factor, max) when factor > max do
    [n]
  end
  defp do_something_with(n, factor, max) do
    do_something_with(n, factor + 1, max)
  end

end
