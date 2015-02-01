defmodule DNA do

  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer | nil
  def hamming_distance(strand1, strand2) when length(strand1) != length(strand2), do: nil
  def hamming_distance(strand1, strand2) do
    strand1
    |> Stream.zip(strand2)
    |> Stream.reject(&identical_chars?/1)
    |> Enum.count
  end

  @spec identical_chars?({char, char}) :: boolean
  defp identical_chars?({char1, char2}) when char1 === char2, do: true
  defp identical_chars?({_, _}), do: false

end
