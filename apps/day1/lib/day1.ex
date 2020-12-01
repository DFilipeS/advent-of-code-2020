defmodule Day1 do
  @moduledoc """
  Documentation for `Day1` problems.

  Source: https://adventofcode.com/2020/day/1
  """

  def run_part_1(path) do
    path
    |> read_input()
    |> find_match(2)
  end

  def run_part_2(path) do
    path
    |> read_input()
    |> find_match(3)
  end

  defp read_input(path) do
    path
    |> File.read!()
    |> String.split()
    |> Enum.map(&String.to_integer/1)
  end

  defp find_match(values, total_matches, elements \\ [])

  defp find_match(values, total_matches, elements)
       when length(elements) == total_matches - 1 do
    Enum.reduce_while(values, nil, fn value, _ ->
      elements = elements ++ [value]

      cond do
        Enum.sum(elements) == 2020 ->
          {:halt, Enum.reduce(elements, 1, &(&1 * &2))}

        true ->
          {:cont, nil}
      end
    end)
  end

  defp find_match(values, total_matches, elements) do
    Enum.reduce_while(values, nil, fn value, _ ->
      case find_match(values, total_matches, elements ++ [value]) do
        nil -> {:cont, nil}
        result -> {:halt, result}
      end
    end)
  end
end
