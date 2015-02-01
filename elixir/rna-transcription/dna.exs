defmodule DNA do

  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
    |> Enum.map(&(dna_to_rna[&1]))
  end

  @spec dna_to_rna() :: Dict.t
  defp dna_to_rna do
    %{?A => ?U, ?C => ?G, ?T => ?A, ?G => ?C}
  end

end
