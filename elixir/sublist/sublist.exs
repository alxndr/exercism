defmodule Sublist do

  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.

  iex> SubList.compare([], [])
  :equal
  """
  def compare(l, l), do: :equal
  def compare([], _), do: :sublist
  def compare(first, second) do
    case { length(first), length(second) } do
      { first_length, second_length } when first_length < second_length -> sublist_or_unequal(first, second)
      { first_length, second_length } when first_length > second_length -> superlist_or_unequal(first, second)
      _ -> :unequal
    end
  end

  defp sublist_or_unequal(first, second) do
    if sublist?(first, second) do
      :sublist
    else
      :unequal
    end
  end

  defp superlist_or_unequal(first, second) do
    if sublist?(second, first) do
      :superlist
    else
      :unequal
    end
  end

  defp sublist?([], _), do: true
  defp sublist?(first, second) do
    _sublist_with_lengths?(first, second, length(first), length(second))
  end

  defp _sublist_with_lengths?(_, _, first_length, second_length) when first_length > second_length, do: false
  defp _sublist_with_lengths?(first, second=[_|second_tail], first_length, second_length) do
    if _sublist_without_lengths?(first, second) do
      true
    else
      _sublist_with_lengths?(first, second_tail, first_length, second_length - 1)
    end
  end

  defp _sublist_without_lengths?([], _), do: true
  defp _sublist_without_lengths?([a|first_tail], [a|second_tail]), do: _sublist_without_lengths?(first_tail, second_tail)
  defp _sublist_without_lengths?(_, _), do: false

end
