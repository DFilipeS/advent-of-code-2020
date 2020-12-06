defmodule Day6 do
  @moduledoc """
  Documentation for `Day6` problems.

  Source: https://adventofcode.com/2020/day/6
  """

  def total_affirmative(path, :any) do
    path
    |> read_input()
    |> Enum.map(&List.flatten/1)
    |> count_any_affirmative()
  end

  def total_affirmative(path, :all) do
    path
    |> read_input()
    |> Enum.map(&count_all_affirmative/1)
    |> Enum.sum()
  end

  defp read_input(path) do
    path
    |> File.read!()
    |> String.split("\n\n", trim: true)
    |> Enum.map(&parse_group/1)
  end

  defp parse_group(raw) do
    raw
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, "", trim: true))
  end

  defp count_any_affirmative(groups) do
    Enum.reduce(groups, 0, fn group, counter ->
      group
      |> Enum.uniq()
      |> length()
      |> Kernel.+(counter)
    end)
  end

  defp count_all_affirmative(group) do
    group
    |> List.flatten()
    |> Enum.frequencies()
    |> Enum.reduce(0, fn {_elem, total}, counter ->
      cond do
        total == length(group) -> counter + 1
        true -> counter
      end
    end)
  end
end
