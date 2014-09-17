defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare([], []), do: :equal
  def compare([], _b), do: :sublist
  def compare(_a, []), do: :superlist
  def compare(a, a),   do: :equal # faster with this?
  def compare([first_h|first_t], [second_h|second_t]) do
    IO.puts "testing #{first_h}|#{Enum.join first_t}, #{second_h}|#{Enum.join second_t}"
    tails_result = compare first_t, second_t
    if first_h == second_h do
      IO.puts "heads match, looking at tails..."
      IO.puts "(...tails result: #{tails_result}"
      tails_result
    else
      IO.puts "heads don't match"
      if first_t == [] and second_t == [] do
        IO.puts "no tails, unequal!"
        :unequal
      else
        IO.puts "tails comparison: #{tails_result}"
        something = compare [first_h|first_t], second_t
        IO.puts "first-with-second-tail comparison: #{something}"
        something
      end
    end
  end
end
