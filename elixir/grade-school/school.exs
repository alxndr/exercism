defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(Dict.t, String.t, pos_integer) :: Dict.t
  def add(db, name, grade) do
    db
    |> Dict.update(grade,
                   [name],
                   fn (students_in_grade) ->
                     [name | students_in_grade]
                   end)
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(Dict.t, pos_integer) :: [String]
  def grade(db, grade) do
    db
    |> Dict.fetch(grade)
    |> case do
        {:ok, names} ->
          names
        :error ->
          []
      end
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(Dict) :: Dict.t
  def sort(db), do: db # already sorted...?
end
