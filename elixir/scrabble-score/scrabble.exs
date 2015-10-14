defmodule Scrabble do

  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    word
    |> String.upcase
    |> String.graphemes
    |> Enum.reduce(0, &(&2 + score_for(&1)))
  end

  @spec score_for(String.t) :: non_neg_integer
  defp score_for(letter) when letter in ~w(A    E   I  L N O  R S T U      ), do: 1
  defp score_for(letter) when letter in ~w(    D  G                        ), do: 2
  defp score_for(letter) when letter in ~w( B C         M   P              ), do: 3
  defp score_for(letter) when letter in ~w(      F H                 V W Y ), do: 4
  defp score_for(letter) when letter in ~w(           K                    ), do: 5
  defp score_for(letter) when letter in ~w(          J                  X  ), do: 8
  defp score_for(letter) when letter in ~w(                  Q            Z), do: 10
  defp score_for(_), do: 0

end
