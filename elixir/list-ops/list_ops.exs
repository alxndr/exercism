defmodule ListOps do

  @spec count(list) :: non_neg_integer
  def count([]),             do: 0
  def count([_head | tail]), do: 1 + count(tail)

  @spec reverse(list) :: list
  def reverse([]),            do: []
  def reverse([head | tail]), do: :lists.append(reverse(tail), [ head ])

  @spec map(list, (any -> any)) :: list
  def map(_l, _f) do
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(_l, _f) do
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(_l, _acc, _f) do
  end

  @spec append(list, list) :: list
  def append(_a, _b) do
  end

  @spec concat([[any]]) :: [any]
  def concat(_ll) do
  end

end
