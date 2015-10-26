defmodule Triplet do

  @doc """
  Calculates sum of a given triplet of integers.
  """
  @spec sum([non_neg_integer]) :: non_neg_integer
  def sum([a, b, c]) do
    a + b + c
  end

  @doc """
  Calculates product of a given triplet of integers.
  """
  @spec product([non_neg_integer]) :: non_neg_integer
  def product([a, b, c]) do
    a * b * c
  end

  @doc """
  Determines if a given triplet is pythagorean. That is, do the squares of a and b add up to the square of c?
  """
  @spec pythagorean?([non_neg_integer]) :: boolean
  def pythagorean?([a, b, c]) do
    a * a + b * b == c * c
  end

  @doc """
  Generates a list of pythagorean triplets from a given min (or 1 if no min) to a given max.
  """
  @spec generate(non_neg_integer, non_neg_integer) :: [list(non_neg_integer)]
  def generate(min\\1, max) when max > min do
    {[], [min, min, min], min, max}
    |> generate_all
    |> Enum.filter(&pythagorean?/1)
    |> Enum.map(&Enum.sort/1)
    |> Enum.uniq
    |> Enum.sort
  end

  defp generate_all({all, [a, _b, _c], _min, max}) when a > max, do: all
  defp generate_all({all, [a, b, _c], min, max}) when b > max do
    generate_all({all, [a+1, min, min], min, max})
  end
  defp generate_all({all, [a, b, c], min, max}) when c > max do
    generate_all({all, [a, b+1, min], min, max})
  end
  defp generate_all({all, [a, b, c]=numbers, min, max}) do
    more = [ numbers | all ]
    generate_all({more, [a, b, c + 1], min, max})
  end

  @doc """
  Generates a list of pythagorean triplets from a given min to a given max, whose values add up to a given sum.
  """
  @spec generate(non_neg_integer, non_neg_integer, non_neg_integer) :: [list(non_neg_integer)]
  def generate(min, max, sum) do
    generate(min, max)
    |> Enum.filter(fn
      [a, b, c] when a + b + c == sum -> true
      _ -> false
    end)
  end
end
