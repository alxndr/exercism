defmodule Scrabble do

  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    word
    |> String.downcase
    |> String.split("")
    |> Enum.reduce(0, &(&2 + score_for(&1)))
  end

  @spec score_for(String.t) :: non_neg_integer
  defp score_for("a"), do: 1
  defp score_for("b"), do: 3
  defp score_for("c"), do: 3
  defp score_for("d"), do: 2
  defp score_for("e"), do: 1
  defp score_for("f"), do: 4
  defp score_for("g"), do: 2
  defp score_for("h"), do: 4
  defp score_for("i"), do: 1
  defp score_for("j"), do: 8
  defp score_for("k"), do: 5
  defp score_for("l"), do: 1
  defp score_for("m"), do: 3
  defp score_for("n"), do: 1
  defp score_for("o"), do: 1
  defp score_for("p"), do: 3
  defp score_for("q"), do: 10
  defp score_for("r"), do: 1
  defp score_for("s"), do: 1
  defp score_for("t"), do: 1
  defp score_for("u"), do: 1
  defp score_for("v"), do: 4
  defp score_for("w"), do: 4
  defp score_for("x"), do: 8
  defp score_for("y"), do: 4
  defp score_for("z"), do: 10
  defp score_for(_), do: 0

end
