defmodule Words do

  def count(text) do
    text
    |> split_words
    |> count_words
  end

  defp count_words(list) do
    Enum.reduce list, %{}, &reducer/2
  end

  defp increment(number) do
    1 + number
  end

  defp reducer([word], acc) do
    Dict.update(acc, word, 1, &increment/1)
  end

  defp split_words(text) do
    Regex.scan ~r/[\p{L}0-9-]+/i, String.downcase(text)
  end

end
