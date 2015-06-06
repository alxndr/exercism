defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) do
    (2..limit)
    |> Enum.to_list # TODO try to make lazy?
    |> primes_in(0)
  end

  defp primes_in(raw_sieve, index) when index >= length(raw_sieve), do: raw_sieve
  defp primes_in(raw_sieve, index) do
    factor = Enum.at(raw_sieve, index)
    raw_sieve
    |> Enum.reduce([], fn # could use Enum.reject
      (n, sieve) when n == factor         -> sieve ++ [n]
      (n, sieve) when rem(n, factor) == 0 -> sieve
      (n, sieve)                          -> sieve ++ [n]
    end)
    |> primes_to(index + 1)
  end
end
