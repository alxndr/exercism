defmodule Sublist do

  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.

  iex> SubList.compare([], [])
  :equal
  """
  def compare(l, l), do: :equal
  def compare([], _), do: :sublist
  def compare(first, second) when length(first) < length(second) do
    if sublist?(first, second), do: :sublist, else: :unequal
  end
  def compare(first, second) when length(first) > length(second) do
    if sublist?(second, first), do: :superlist, else: :unequal
  end
  def compare(_, _), do: :unequal

  defp sublist?([], _), do: true
  defp sublist?(first, second) when length(first) > length(second), do: false
  defp sublist?(first, second=[_|second_tail]) do
    if _sublist?(first, second) do
      true
    else
      sublist?(first, second_tail)
    end
  end

  defp _sublist?([], _), do: true
  defp _sublist?([a|first_tail], [a|second_tail]), do: _sublist?(first_tail, second_tail)
  defp _sublist?(_, _), do: false

end
