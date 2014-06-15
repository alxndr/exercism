defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    compare_with_accumulator(a, b, :equal)
  end

  defp compare_with_accumulator([], [], acc), do: :equal
  defp compare_with_accumulator([], _, acc),  do: :sublist
  defp compare_with_accumulator(_, [], acc),  do: :superlist
  defp compare_with_accumulator([ahead|[]], [bhead|[]], _acc) do
    cond do
      ahead == bhead -> :equal
      ahead == []    -> :sublist
      bhead == []    -> :superlist
      true           -> :unequal
    end
  end
  defp compare_with_accumulator([ahead|atail], [bhead|btail], _acc) do
    cond do
      ahead == bhead -> compare_with_accumulator(atail, btail, :equal)
      true           -> compare_with_accumulator(atail, btail, :unequal)
    end
  end

end
