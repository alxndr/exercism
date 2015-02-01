defmodule Word do
  defstruct original: nil, downcased: nil, alphabetized: nil
end

defmodule Anagram do

  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    base_downcased = base
                      |> String.downcase
    base_alphabetized = base_downcased
                        |> alphabetize
    word = %Word{original: base, downcased: base_downcased, alphabetized: base_alphabetized }
    candidates
    |> Enum.filter(fn (candidate) -> anagram?(word, candidate) end)
  end

  defp anagram?(word, candidate) do
    candidate_downcased = candidate
                          |> String.downcase
    word.alphabetized == alphabetize(candidate_downcased) && candidate_downcased != word.downcased
  end

  @spec alphabetize(String.t) :: String.t
  defp alphabetize(word) do
    word
    |> String.graphemes
    |> Enum.sort
  end

end
