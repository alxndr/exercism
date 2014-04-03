defmodule Words do

  def count(text) do
    text |> split_words |> count_words
  end

  defp split_words(text) do
    Regex.scan(%r/[\p{L}0-9]+/i , String.downcase(text))
  end

  defp count_words(list) do
    list |> Enum.reduce(HashDict.new, fn [word], acc -> HashDict.update acc, word, 1, &(1 + &1) end)
  end

end
