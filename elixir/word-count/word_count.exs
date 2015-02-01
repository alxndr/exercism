defmodule Words do

  @doc """
  Counts the number of occurrences of unique whitespace-split words and numbers in a string.
  """
  @spec count(String.t) :: Number
  def count(text) do
    text
    |> String.downcase
    |> split_words
    |> count_words
  end

  @spec count_words(List) :: Number
  defp count_words(word_list) do
    Enum.reduce word_list, %{}, &reducer/2
  end

  defp reducer([word], census) do
    Dict.update census, word, 1, &(&1 + 1)
  end

  @spec split_words(String.t) :: [String.t]
  defp split_words(text) do
    Regex.scan ~r/(*UTF)[\p{L}0-9-]+/i, text
  end

end
