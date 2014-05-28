defmodule ListOps do

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _function),         do: acc
  def reduce([head|tail], acc, function), do: reduce(tail, function.(head, acc), function)

  @spec count(list) :: non_neg_integer
  def count(list), do: reduce(list, 0, fn (_, acc) -> acc + 1 end)

  @spec reverse(list) :: list
  def reverse(list), do: reduce(list, [], &([&1 | &2]))

  @spec append(list, list) :: list
  def append(list, list2), do: reduce(reverse(list), list2, &([&1 | &2]))

  @spec concat([[any]]) :: [any]
  def concat(list), do: reduce(list, [], &(append &2, &1))

  @spec map(list, (any -> any)) :: list
  def map(list, function), do: reduce(reverse(list), [], &([ function.(&1) | &2 ]))

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
