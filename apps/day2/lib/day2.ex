defmodule Day2 do
  @moduledoc """
  Documentation for `Day2` problems.

  Source: https://adventofcode.com/2020/day/2
  """

  def validate(path, policy) do
    path
    |> read_input(policy)
    |> Enum.map(&is_valid?/1)
    |> Enum.filter(& &1)
    |> length()
  end

  def is_valid?(%{"min" => min, "max" => max, "target" => target, "password" => password}) do
    occurrences =
      password
      |> String.split("", trim: true)
      |> Enum.frequencies()
      |> Map.get(target)

    occurrences >= min and occurrences <= max
  end

  def is_valid?(%{"pos1" => pos1, "pos2" => pos2, "target" => target, "password" => password}) do
    (target == String.at(password, pos1 - 1) or target == String.at(password, pos2 - 1)) and
      not (target == String.at(password, pos1 - 1) and target == String.at(password, pos2 - 1))
  end

  defp read_input(path, policy) do
    path
    |> File.read!()
    |> String.split("\n")
    |> Enum.map(fn input ->
      [frequency, target, password] = String.split(input)

      frequency =
        case policy do
          :sled_rental ->
            Regex.named_captures(~r/(?<min>([0-9])*)-(?<max>([0-9])*)/, frequency)
            |> Map.update!("min", &String.to_integer/1)
            |> Map.update!("max", &String.to_integer/1)

          :otcas ->
            Regex.named_captures(~r/(?<pos1>([0-9])*)-(?<pos2>([0-9])*)/, frequency)
            |> Map.update!("pos1", &String.to_integer/1)
            |> Map.update!("pos2", &String.to_integer/1)
        end

      target = Regex.named_captures(~r/(?<target>.):/, target)

      %{"password" => password}
      |> Map.merge(frequency)
      |> Map.merge(target)
    end)
  end
end
