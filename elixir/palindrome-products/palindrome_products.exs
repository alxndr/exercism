defmodule Palindromes do

  @doc """
  Generates all palindrome products from an optionally given min factor (or 1) to a given max factor.
  """
  @spec generate(non_neg_integer, non_neg_integer) :: map()
  def generate(max_factor, min_factor \\ 1) do
    palindromes(max_factor, min_factor)
    |> Enum.reduce(%{}, &add_to_map/2)
  end

  defp palindromes(max_factor, min_factor) do
    for a <- min_factor..max_factor,
    b <- a..max_factor,
    String.reverse("#{a * b}") == "#{a * b}",
      do: {a * b, [a, b]}
  end

  defp add_to_map({product, pairs}, map) do
    map
    |> Map.put(product, Map.get(map, product, []) ++ [pairs])
  end
end
