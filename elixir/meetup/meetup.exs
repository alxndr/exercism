defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @type date_tuple :: {pos_integer, 1..12, 1..31}

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, :first) do
    find_weekday_on_or_following weekday, {year, month, 1}
  end
  def meetup(year, month, weekday, :second) do
    find_weekday_on_or_following weekday, {year, month, 8}
  end
  def meetup(year, month, weekday, :third) do
    find_weekday_on_or_following weekday, {year, month, 15}
  end
  def meetup(year, month, weekday, :fourth) do
    find_weekday_on_or_following weekday, {year, month, 22}
  end
  def meetup(year, month, weekday, :last) do
    last_day_of_month = :calendar.last_day_of_the_month(year, month)
    find_weekday_on_or_following weekday, {year, month, (last_day_of_month - 6)}
  end
  def meetup(year, month, weekday, :teenth) do
    find_weekday_on_or_following weekday, {year, month, 13}
  end

  @spec find_weekday_on_or_following(schedule | 1..7, date_tuple) :: date_tuple
  defp find_weekday_on_or_following(weekday, date_tuple)
  when not is_integer(weekday) do
    find_weekday_on_or_following weekday_to_int(weekday), date_tuple
  end
  defp find_weekday_on_or_following(weekday_int, date_tuple = {y, m, d}) do
    if weekday_int == :calendar.day_of_the_week(date_tuple) do
      date_tuple
    else
      find_weekday_on_or_following weekday_int, {y, m, d+1}
    end
  end

  @spec weekday_to_int(Atom) :: 1..7
  defp weekday_to_int(:monday), do: 1
  defp weekday_to_int(:tuesday), do: 2
  defp weekday_to_int(:wednesday), do: 3
  defp weekday_to_int(:thursday), do: 4
  defp weekday_to_int(:friday), do: 5
  defp weekday_to_int(:saturday), do: 6
  defp weekday_to_int(:sunday), do: 7
end
