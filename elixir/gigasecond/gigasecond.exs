defmodule Gigasecond do

  @type seconds :: pos_integer
  @type time_tuple :: {0..23, 0..59, 0..60} # leap second y'all
  @type datetime_tuple :: {:calendar.date, time_tuple}

  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from(:calendar.date) :: :calendar.date
  def from(date = {_y, _m, _d}) do
    date
    |> to_seconds
    |> plus_gigasecond
    |> to_date
  end

  @spec to_seconds(:calendar.date) :: seconds
  defp to_seconds(date) do
    date
    |> ymd_to_datetime
    |> :calendar.datetime_to_gregorian_seconds
  end

  @spec plus_gigasecond(seconds) :: seconds
  defp plus_gigasecond(seconds), do: seconds + 1_000_000_000

  @spec to_date(seconds) :: :calendar.date
  defp to_date(seconds) do
    seconds
    |> :calendar.gregorian_seconds_to_datetime
    |> extract_date
  end

  @spec ymd_to_datetime(:calendar.date) :: datetime_tuple
  defp ymd_to_datetime(date = {_y, _m, _d}), do: {date, {0, 0, 0}}

  @spec extract_date(datetime_tuple) :: :calendar.date
  defp extract_date({date = {_y, _m, _d}, {_, _, _}}), do: date
end
