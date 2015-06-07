defmodule Atbash do

  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t) :: String.t
  def encode(plaintext) do
    plaintext
    |> String.graphemes
    |> sanitize
    |> Enum.reverse
    |> encode([])
    |> Enum.chunk(5, 5, [])
    |> Enum.map(&Enum.join(&1, ""))
    |> Enum.join(" ")
  end
  defp encode([], encoded), do: encoded
  defp encode([h|t], encoded) do
    encode(t, [encoded_letter(h) | encoded])
  end

  @spec sanitize([String.t]) :: [String.t]
  defp sanitize(letters) do
    sanitize(letters, [])
  end
  defp sanitize([], sanitized_letters), do: sanitized_letters
  defp sanitize([letter|letters], sanitized_letters) do
    letter = String.downcase(letter)
    cond do
      Regex.match?(~r/^[0-9]$/, letter) ->
        sanitize(letters, sanitized_letters ++ [letter])
      Regex.match?(~r/^[a-z]$/, letter) ->
        sanitize(letters, sanitized_letters ++ [letter])
      true ->
        sanitize(letters, sanitized_letters)
    end
  end

  @spec encoded_letter(String.t) :: String.t
  defp encoded_letter(num_str = <<n>>) when n >= 48 and n <= 57, do: num_str
  defp encoded_letter(<<n>>) when n >= 97 and n <= 122, do: << 219 - n >>

end
