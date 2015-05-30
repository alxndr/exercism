defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(n), do: Math.pow(2, n - 1)

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total do
    1..64
    |> Enum.reduce(0, &(&2 + square(&1)))
  end

end

defmodule Math do
  def pow(n, 0), do: 1
  def pow(n, 1), do: n
  def pow(n, exponent) do
    n * pow(n, exponent-1)
  end
end
