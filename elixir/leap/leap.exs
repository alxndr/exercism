defmodule Year do
  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      except every year that is evenly divisible by 400.
  """
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(y) when rem(y, 400) == 0, do: true
  def leap_year?(y) when rem(y, 100) == 0, do: false
  def leap_year?(y) when rem(y, 4) == 0,   do: true
  def leap_year?(_year),                   do: false
end
