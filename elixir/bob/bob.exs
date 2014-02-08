defmodule Teenager do

  def hey(input) do
    cond do
      Regex.match?(%r/[[:alpha:]]/, input) and String.upcase(input) == input -> "Woah, chill out!"
      Regex.match?(%r/\?$/, input) -> "Sure."
      Regex.match?(%r/^\s*$/, input) -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end

  # defp # private function

end
