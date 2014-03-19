defmodule Teenager do

  def hey(input) do
    trimmed = input |> String.strip
    cond do
      trimmed |> is_empty?      -> "Fine. Be that way!"
      trimmed |> is_yelling?    -> "Woah, chill out!"
      trimmed |> is_a_question? -> "Sure."
      true -> "Whatever."
    end
  end

  defp is_empty?(string) do
    string == ""
  end

  defp is_yelling?(string) do
    string |> String.upcase == string and string |> String.match? %r/[[:alpha:]]/
  end

  defp is_a_question?(string) do
    string |> String.ends_with?("?")
  end

end
