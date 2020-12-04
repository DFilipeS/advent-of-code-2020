defmodule Passport do
  @fields [
    :birth_year,
    :issue_year,
    :expiration_year,
    :height,
    :hair_color,
    :eye_color,
    :passport_id,
    :country_id
  ]

  @required_fields @fields -- [:country_id]

  defstruct @fields

  def is_complete?(passport) do
    @required_fields
    |> Enum.map(&(not is_nil(Map.get(passport, &1))))
    |> Enum.all?()
  end

  def is_valid?(passport) do
    @required_fields
    |> Enum.map(&validate(&1, Map.get(passport, &1)))
    |> Enum.all?()
  end

  defp validate(:birth_year, nil), do: false

  defp validate(:birth_year, value) do
    value >= 1920 and value <= 2002
  end

  defp validate(:issue_year, nil), do: false

  defp validate(:issue_year, value) do
    value >= 2010 and value <= 2020
  end

  defp validate(:expiration_year, nil), do: false

  defp validate(:expiration_year, value) do
    value >= 2020 and value <= 2030
  end

  defp validate(:height, %{value: value, unit: "cm"}) do
    value >= 150 and value <= 193
  end

  defp validate(:height, %{value: value, unit: "in"}) do
    value >= 59 and value <= 76
  end

  defp validate(:height, _), do: false

  defp validate(:hair_color, nil), do: false

  defp validate(:hair_color, "#" <> value) do
    String.length(value) == 6 and Regex.match?(~r/^([0-9a-fA-F])*$/, value)
  end

  defp validate(:hair_color, _), do: false

  defp validate(:eye_color, nil), do: false

  defp validate(:eye_color, value) do
    value in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
  end

  defp validate(:passport_id, nil), do: false

  defp validate(:passport_id, value) do
    String.length(value) == 9
  end
end
