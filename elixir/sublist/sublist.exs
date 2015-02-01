defmodule Sublist do

  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.

  iex> SubList.compare([], [])
  :equal
  """
  @spec compare([any], [any]) :: atom
  def compare(l, l), do: :equal
  def compare([], _), do: :sublist
  def compare(first, second) when length(first) < length(second) do
    if first |> sublist_of?(second), do: :sublist, else: :unequal
  end
  def compare(first, second) when length(first) > length(second) do
    if second |> sublist_of?(first), do: :superlist#, else: :unequal # TODO o_O
  end
  def compare(_, _), do: :unequal

  defp sublist_of?([], _), do: true
  defp sublist_of?(first, second) when length(first) > length(second), do: false
  defp sublist_of?(first, second=[_|second_tail]) do
    if at_head_of?(first, second) do
      true
    else
      sublist_of?(first, second_tail)
    end
  end

  defp at_head_of?([], _), do: true
  defp at_head_of?([a|first_tail], [a|second_tail]), do: first_tail |> at_head_of?(second_tail)
  defp at_head_of?(_, _), do: false

end
