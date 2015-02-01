defmodule Sublist do

  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  @spec compare([any], [any]) :: atom
  def compare(first, second) do
    cond do
      first === second ->
        :equal
      sublist_of?(first, second) ->
        :sublist
      sublist_of?(second, first) ->
        :superlist
      true ->
        :unequal
    end
  end

  defp sublist_of?([], _), do: true
  defp sublist_of?(_, []), do: false
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
