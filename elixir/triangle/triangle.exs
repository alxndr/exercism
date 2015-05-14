defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @error_equality {:error, "side lengths violate triangle inequality"}
  @error_negative {:error, "all side lengths must be positive"}

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }
  def kind(a, b, c) when a <= 0     or b <= 0     or c <= 0,     do: @error_negative
  def kind(a, b, c) when a + b <= c or a + c <= b or b + c <= a, do: @error_equality
  def kind(n, n, n), do: {:ok, :equilateral}
  def kind(odd, even, even) when even + even > odd, do: {:ok, :isosceles}
  def kind(even, odd, even) when even + even > odd, do: {:ok, :isosceles}
  def kind(even, even, odd) when even + even > odd, do: {:ok, :isosceles}
  def kind(_, _, _), do: {:ok, :scalene}

end
