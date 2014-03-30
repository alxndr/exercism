defmodule Teenager do

  def hey(input) do
    trimmed = String.strip(input)
    cond do
      is_empty?(trimmed)      -> "Fine. Be that way!"
      is_yelling?(trimmed)    -> "Woah, chill out!"
      is_a_question?(trimmed) -> "Sure."
      true                    -> "Whatever."
    end
  end

  defp is_empty?(""),   do: true
  defp is_empty?(_str), do: false

  defp is_yelling?(str) do
    String.upcase(str) == str and String.match?(str, %r/\p{L}/)
  end

  defp is_a_question?(str) do
    String.ends_with?(str, "?")
  end

end
