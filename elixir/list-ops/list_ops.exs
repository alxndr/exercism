defmodule ListOps do

  @spec count(list) :: non_neg_integer
  def count([]),         do: 0
  def count([ _h | t ]), do: 1 + count(t)

  @spec reverse(list) :: list
  def reverse(list), do: reverse_with_acc(list, [])
  defp reverse_with_acc([], acc),        do: acc
  defp reverse_with_acc([ h | t ], acc), do: reverse_with_acc(t, [h | acc])

  @spec map(list, (any -> any)) :: list
  def map([], _f),             do: []
  def map([ head | tail ], f), do: [ f.(head) | map(tail, f) ]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _f),            do: []
  def filter([ head | tail ], f) do
    if f.(head) do
      [ head | filter(tail, f) ]
    else
      filter(tail, f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _f),        do: acc
  def reduce([head|tail], acc, f) do
    reduce(tail, f.(head, acc), f)
  end

  @spec append(list, list) :: list
  def append([], list),         do: list
  def append(list, []),         do: list
  def append(list, list2),      do: append_with_acc(list, list2)
  defp append_with_acc([], acc),  do: acc
  defp append_with_acc(list, acc) do # crazy slow with 1m entries
    [ last | rest_backwards ] = reverse(list)
    append_with_acc(reverse(rest_backwards), [ last | acc ])
  end

  @spec concat([[any]]) :: [any]
  def concat(list_2d) do
    reduce(list_2d, [], &( append(&2, &1) ))
  end

end
