defmodule Atbash do

  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t) :: String.t
  @spec encode([String.t], [String.t]) :: [String.t]
  def encode(plaintext) do
    plaintext
    |> String.downcase
    |> String.graphemes
    |> encode([])
    |> flatten
    |> Enum.chunk(5, 5, [])
    |> Enum.map(&Enum.join(&1, ""))
    |> Enum.join(" ")
  end
  defp encode([], encoded), do: encoded
  defp encode([h|t], encoded) do
    encode(t, encoded ++ [encoded_letter(h)])
  end

  @spec encoded_letter(String.t) :: String.t
  defp encoded_letter(num_str = <<n>>) when n >= 48 and n <= 57, do: num_str
  defp encoded_letter(<<n>>) when n >= 97 and n <= 122, do: << 219 - n >>
  defp encoded_letter(_), do: nil

  @spec flatten([any]) :: [any]
  defp flatten(list) do
    Enum.reduce list, [], &if(&1, do: &2 ++ [&1], else: &2)
  end

end
