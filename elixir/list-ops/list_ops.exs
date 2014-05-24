defmodule ListOps do

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _function),         do: acc
  def reduce([head|tail], acc, function), do: reduce(tail, function.(head, acc), function)

  @spec count(list) :: non_neg_integer
  def count(list), do: reduce(list, 0, fn (_, acc) -> acc + 1 end)

  @spec reverse(list) :: list
  def reverse(list), do: reduce(list, [], &([&1 | &2]))

  @spec concat([[any]]) :: [any]
  def concat(list), do: reduce(list, [], &(append &2, &1))

  @spec append(list, list) :: list
  def append(list, list2),      do: _append(reverse(list), list2)
  defp _append([], acc),        do: acc
  defp _append([ h | t ], acc), do: _append(t, [ h | acc ])

  @spec map(list, (any -> any)) :: list
  def map([], _f),             do: []
  def map([ head | tail ], f), do: [ f.(head) | map(tail, f) ]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _function),            do: []
  def filter([ head | tail ], function) do
    if function.(head) do
      [ head | filter(tail, function) ]
    else
      filter(tail, function)
    end
  end

end
