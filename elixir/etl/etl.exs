defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"]}, "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(Dict.t) :: map()
  def transform(input) do
    input
    |> Enum.reduce(%{}, &transform/2)
  end

  @spec transform({Integer, [String.t]}, %{}) :: %{}
  defp transform({count, words}, transformed_acc) do
    words
    |> Enum.reduce(transformed_acc, fn(word, inner_acc) ->
      Dict.put inner_acc, String.downcase(word), count
    end)
  end
end
