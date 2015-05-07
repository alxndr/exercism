defmodule Phone do
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    raw
    |> sanitize_number
    |> maybe_trim
  end

  @spec sanitize_number(String.t) :: String.t
  defp sanitize_number(numerical_input) do
    numerical_input
    |> String.replace(~r{\D}, "")
  end

  @spec maybe_trim(String.t) :: String.t
  defp maybe_trim(numerical_string) do
    cond do
      matches = Regex.named_captures(~r/^1(?<remainder>\d{10}+)$/, numerical_string) ->
        matches["remainder"]
      Regex.named_captures(~r/^1(?<remainder>\d{9}+)$/, numerical_string) ->
        numerical_string
      true ->
        "0000000000"
    end
  end

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    raw
    |> sanitize_number
    |> trim_extra_leading_one
    |> String.slice 0, 3
  end

  @spec trim_extra_leading_one(String.t) :: String.t
  defp trim_extra_leading_one(numerical_string) do
    if has_extra_leading_one?(numerical_string) do
      Regex.named_captures(~r/^1(?<remainder>\d{10}+)$/, numerical_string)["remainder"]
    else
      numerical_string
    end
  end

  @spec has_extra_leading_one?(String.t) :: boolean
  defp has_extra_leading_one?(numerical_string) do
    String.length(numerical_string) == 11 && String.starts_with?(numerical_string, "1")
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    raw
    |> sanitize_number
    |> trim_extra_leading_one
    |> (fn (digits) ->
      { area_code, other_stuff } = String.split_at(digits, 3)
      { first_three, last_four } = String.split_at(other_stuff, 3)
      "(#{area_code}) #{first_three}-#{last_four}"
    end).()
  end
end
