defmodule Day4 do
  @moduledoc """
  Documentation for `Day4` problems.

  Source: https://adventofcode.com/2020/day/4
  """

  def validate(path, :format) do
    path
    |> read_input()
    |> Enum.filter(&Passport.is_complete?/1)
    |> length()
  end

  def validate(path, :data) do
    path
    |> read_input()
    |> Enum.filter(&Passport.is_valid?/1)
    |> length()
  end

  defp read_input(path) do
    path
    |> File.read!()
    |> String.split("\n\n")
    |> Enum.map(&parse_passport_data/1)
  end

  defp parse_passport_data(data) do
    data
    |> String.replace("\n", " ")
    |> String.split()
    |> Enum.reduce(%Passport{}, fn param, passport ->
      case param do
        "byr:" <> value -> Map.put(passport, :birth_year, String.to_integer(value))
        "iyr:" <> value -> Map.put(passport, :issue_year, String.to_integer(value))
        "eyr:" <> value -> Map.put(passport, :expiration_year, String.to_integer(value))
        "hgt:" <> value -> Map.put(passport, :height, parse_height(value))
        "hcl:" <> value -> Map.put(passport, :hair_color, value)
        "ecl:" <> value -> Map.put(passport, :eye_color, value)
        "pid:" <> value -> Map.put(passport, :passport_id, value)
        "cid:" <> value -> Map.put(passport, :country_id, value)
        _ -> passport
      end
    end)
  end

  defp parse_height(data) do
    reg = ~r/(?<value>([0-9])*)(?<unit>(cm|in))/

    case Regex.named_captures(reg, data) do
      %{"value" => value, "unit" => unit} ->
        %{value: String.to_integer(value), unit: unit}

      _ ->
        %{value: data, unit: nil}
    end
  end
end
