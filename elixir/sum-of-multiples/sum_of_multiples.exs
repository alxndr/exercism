defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.

  The default factors are 3 and 5.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors \\ [3, 5]) do
    sum_to(2, limit, factors, 0)
  end

  defp sum_to(n, limit, _factors, sum) when n >= limit, do: sum
  defp sum_to(n, limit, factors, sum) do
    new_sum = if is_a_factor?(n, factors) do
      sum + n
    else
      sum
    end
    sum_to(n + 1, limit, factors, new_sum)
  end

  defp is_a_factor?(n, factors) do
    factors
    |> Enum.any? &(rem(n, &1) == 0)
  end
end
