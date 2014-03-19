defmodule Words do

  def count(text) do
    %r/[a-z0-9]+/i |> Regex.scan(String.downcase(text)) |> count_words
  end

  defp count_words(lists) do
    increment = fn(x)-> x + 1 end
    lists |> Enum.reduce HashDict.new, fn(list_of_one_word, acc)->
      HashDict.update acc, List.first(list_of_one_word), 1, increment
    end
  end

end
