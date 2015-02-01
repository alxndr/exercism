defmodule Word do

  @type word :: %Word{ original: String.t, downcased: String.t, alphabetized: String.t }
  defstruct original: nil, downcased: nil, alphabetized: nil

  @doc """
  Determine whether two %Word{}s are anagrams of each other.
  """
  @spec anagram?(Struct.word, Struct.word) :: boolean
  def anagram?(word, candidate) do
    word.alphabetized === candidate.alphabetized
    && candidate.downcased !== word.downcased
  end

  @doc """
  Construct a %Word{} from a bare string.
  """
  @spec create(String.t) :: Struct.word
  def create(word) do
    downcased = word
                |> String.downcase
    alphabetized = downcased
                    |> alphabetize
    %Word{ original: word, downcased: downcased, alphabetized: alphabetized }
  end

  @spec alphabetize(String.t) :: String.t
  defp alphabetize(word) do
    word
    |> String.graphemes
    |> Enum.sort
  end

end

defmodule Anagram do
  @doc """
  Returns all `candidates` that are anagrams of, but not equal to, `word`.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(word, candidates) do
    word = Word.create(word)
    candidates
    |> Enum.filter(fn (candidate) ->
      word
      |> Word.anagram?(Word.create(candidate))
    end)
  end
end
