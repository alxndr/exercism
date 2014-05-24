defmodule ListOps do

  @spec count(list) :: non_neg_integer
  def count(list) do
    reduce list, 0, fn (_, acc) -> acc + 1 end
  end

  @spec reverse(list) :: list
  def reverse(list), do: _reverse(list, [])
  defp _reverse([], acc),        do: acc
  defp _reverse([ h | t ], acc), do: _reverse(t, [h | acc])

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
  def reduce([head|tail], acc, function) do
    reduce tail, function.(head, acc), function
  end

  @spec append(list, list) :: list
  def append(list, list2),      do: _append(reverse(list), list2)
  defp _append([], acc),       do: acc
  defp _append([ h | t ], acc) do
    _append(t, [ h | acc ])
  end

  @spec concat([[any]]) :: [any]
  def concat(list) do
    reduce list, [], &(append &2, &1)
  end

end
