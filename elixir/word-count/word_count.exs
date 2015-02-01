defmodule Words do

  @doc """
  Counts the number of occurrances of unique whitespace-split words and numbers in a string.
  """
  @spec count(String.t) :: Number
  def count(text) do
    text
    |> split_words
    |> count_words
  end

  defp count_words(list) do
    Enum.reduce list, %{}, &reducer/2
  end

  defp reducer([word], census) do
    Dict.update census, word, 1, &(&1 + 1)
  end

  defp split_words(text) do
    Regex.scan ~r/[\p{L}0-9-]+/i, String.downcase(text)
  end

end
