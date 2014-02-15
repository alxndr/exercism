defmodule Words do

  def count(text) do
    increment = fn(x)-> x + 1 end
    Regex.replace(%r/[^a-z0-9 ]/i, String.downcase(text), '') # why need parens?
    |> String.split
    |> Enum.reduce HashDict.new, fn(word, acc)->
      HashDict.update acc, word, 1, increment
    end
  end

end
