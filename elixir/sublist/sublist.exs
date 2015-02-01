defmodule Sublist do

  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.

  iex> SubList.compare([], [])
  :equal
  """
  def compare(first, second) do
    case { length(first), length(second) } do
      { first_length, second_length } when first_length < second_length ->
        if sublist?(first, second, first_length, second_length), do: :sublist, else: :unequal
      { first_length, second_length } when first_length > second_length ->
        if sublist?(second, first, second_length, first_length), do: :superlist, else: :unequal
      _ ->
        if first == second, do: :equal, else: :unequal
    end
  end

  defp sublist?(_, _, first_length, second_length) when first_length > second_length, do: false
  defp sublist?([], _, _, _), do: true
  defp sublist?(first, second=[_|second_tail], first_length, second_length) do
    if _sublist?(first, second), do: true, else: sublist?(first, second_tail, first_length, second_length - 1)
  end

  defp _sublist?([], _), do: true
  defp _sublist?([a|first_tail], [a|second_tail]), do: _sublist?(first_tail, second_tail)
  defp _sublist?(_, _), do: false

end
