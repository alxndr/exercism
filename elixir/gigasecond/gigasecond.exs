defmodule Gigasecond do

  @type time_tuple :: {0..23, 0..59, pos_integer}
  @type datetime_tuple :: {:calendar.date, time_tuple}

  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from(:calendar.date) :: :calendar.date
  def from(date = {_y, _m, _d}) do
    then_in_seconds =
      ymd_to_datetime(date)
      |> :calendar.datetime_to_gregorian_seconds

    (then_in_seconds + 1_000_000_000)
    |> :calendar.gregorian_seconds_to_datetime
    |> extract_date
  end

  @spec ymd_to_datetime(:calendar.date) :: datetime_tuple
  defp ymd_to_datetime(date = {_y, _m, _d}), do: {date, {0, 0, 0}}

  @spec extract_date(datetime_tuple) :: :calendar.date
  defp extract_date({date = {_y, _m, _d}, {_, _, _}}), do: date
end
