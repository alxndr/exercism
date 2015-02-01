defmodule DNA do

  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) when length(strand1) != length(strand2), do: nil
  def hamming_distance(strand1, strand2) do
    strand1
    |> Stream.zip(strand2)
    |> Enum.count(&different_chars?/1)
  end

  @spec different_chars?({char, char}) :: boolean
  defp different_chars?({char, char}), do: false
  defp different_chars?({_char1, _char2}), do: true

end
