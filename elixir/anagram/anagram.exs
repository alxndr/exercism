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
    candidates
    |> Enum.filter(fn (candidate) ->
      candidate_downcased = candidate
                            |> String.downcase
      base_alphabetized == alphabetize(candidate_downcased) && candidate_downcased != base_downcased
    end)
  end

  @spec alphabetize(String.t) :: String.t
  defp alphabetize(word) do
    word
    |> String.to_char_list
    |> Enum.sort
  end

end
