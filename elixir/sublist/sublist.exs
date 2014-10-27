defmodule Sublist do

  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.

  iex> SubList.compare([], [])
  :equal
  """
  def compare(a, a),   do: :equal
  def compare([], _b), do: :sublist
  def compare(_a, []), do: :superlist
  def compare([a|[]], [a|[]]), do: :equal
  def compare([_|[]], [_|[]]), do: :unequal
  #def compare([h|first_t], [h|second_t]) do
    #compare first_t, second_t
  #end
  def compare([h|first_t], [_|second_t]) do
    IO.puts "comparing..."
    IO.inspect [h|first_t]
    IO.inspect second_t
    second_tail_comparison = compare [h|first_t], second_t
    IO.inspect second_tail_comparison
    case second_tail_comparison do
      :equal     -> :sublist
      :superlist -> :unequal
      :unequal   -> :superlist
      :sublist   -> :foo
      #_          -> second_tail_comparison
    end
  end

end
