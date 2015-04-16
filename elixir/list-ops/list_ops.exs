defmodule ListOps do

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([],    acc, _fxn), do: acc
  def reduce([h|t], acc, fxn) do
    t
    |> reduce(fxn.(h, acc), fxn)
  end

  @spec count(list) :: non_neg_integer
  def count(list) do
    list
    |> reduce(0, fn
      (_, acc) -> acc + 1
    end)
  end

  @spec reverse(list) :: list
  def reverse(list) do
    list
    |> reduce([], &([&1 | &2]))
  end

  @spec append(list, list) :: list
  def append(list, list2) do
    list
    |> reverse
    |> reduce(list2, &([&1 | &2]))
  end

  @spec concat([[any]]) :: [any]
  def concat(list) do
    list
    |> reduce([], &append(&2, &1))
  end

  @spec map(list, (any -> any)) :: list
  def map(list, fxn) do
    list
    |> reverse
    |> reduce([], &([ fxn.(&1) | &2 ]))
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(list, fxn) do
    list
    |> reverse
    |> reduce([], make_reducer(fxn))
  end

  defp make_reducer(test_function) do
    fn (element, acc) ->
      if test_function.(element) do
        [ element | acc ]
      else
        acc
      end
    end
  end

end
