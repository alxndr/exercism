defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    strand
    |> Enum.count(&(nucleotide == &1))
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.nucleotide_counts('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec nucleotide_counts([char]) :: Dict.t
  def nucleotide_counts(strand) do
    strand
    |> Enum.reduce(empty_census, &count_nucleotides/2)
  end

  @spec count_nucleotides(char, Dict.t) :: Dict.t
  defp count_nucleotides(nucleotide, census) do
    census
    |> Dict.update!(nucleotide, &(1 + &1))
  end

  @spec empty_census() :: Dict.t
  defp empty_census do
    @nucleotides
    |> Enum.reduce(%{}, &Dict.update(&2, &1, 0, fn(_) -> end))
  end

end
