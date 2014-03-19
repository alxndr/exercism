defmodule Words do

  @spec count(String.t) :: HashDict.t
  def count(text) do
    increment = fn(x)-> x + 1 end # TODO syntax for anonymous fns
    %r/[\p{L}0-9]+/i
    |> Regex.scan(String.downcase(text))
    |> List.flatten
    |> Enum.reduce HashDict.new, fn(word, acc)->
      HashDict.update acc, word, 1, increment
    end
  end

end
