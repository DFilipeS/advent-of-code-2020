defmodule Day3 do
  @moduledoc """
  Documentation for `Day3` problems.

  Source: https://adventofcode.com/2020/day/3
  """

  @slopes [
    [right: 1, down: 1],
    [right: 3, down: 1],
    [right: 5, down: 1],
    [right: 7, down: 1],
    [right: 1, down: 2]
  ]

  def tree_count(path, right: right, down: down) do
    path
    |> read_input()
    |> analyze_slope({0, 0}, right: right, down: down)
  end

  def analyze_all_slopes(path) do
    terrain_map = read_input(path)

    Enum.reduce(@slopes, 1, fn slope, acc ->
      acc * analyze_slope(terrain_map, {0, 0}, slope)
    end)
  end

  defp read_input(path) do
    path
    |> File.read!()
    |> String.split("\n")
    |> Enum.map(&String.split(&1, "", trim: true))
  end

  defp analyze_slope(terrain_map, {_x, y}, _opts) when length(terrain_map) <= y, do: 0

  defp analyze_slope(terrain_map, {x, y}, right: right, down: down) do
    row = Enum.at(terrain_map, y)
    position = rem(x, length(row))

    row
    |> Enum.at(position)
    |> tree_check()
    |> Kernel.+(analyze_slope(terrain_map, {x + right, y + down}, right: right, down: down))
  end

  defp tree_check("#"), do: 1
  defp tree_check(_), do: 0
end
