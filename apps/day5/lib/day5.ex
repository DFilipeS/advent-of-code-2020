defmodule Day5 do
  @moduledoc """
  Documentation for `Day5` problems.

  Source: https://adventofcode.com/2020/day/5
  """

  def max_id(path) do
    path
    |> read_input()
    |> Enum.max_by(& &1.id)
    |> Map.get(:id)
  end

  def find_missing(path) do
    [head | tail] =
      path
      |> read_input()
      |> Enum.sort_by(& &1.id)

    Enum.reduce_while(tail, head, fn seat, previous_seat ->
      cond do
        previous_seat.id == seat.id - 2 -> {:halt, seat.id - 1}
        true -> {:cont, seat}
      end
    end)
  end

  def parse_seat(seat_partition) do
    {row_partition, column_partition} = String.split_at(seat_partition, 7)
    row = get_for_partition(Enum.into(0..127, []), row_partition)
    column = get_for_partition(Enum.into(0..7, []), column_partition)

    %{id: row * 8 + column, row: row, column: column}
  end

  defp read_input(path) do
    path
    |> File.read!()
    |> String.split("\n")
    |> Enum.map(&parse_seat/1)
  end

  defp get_for_partition(seats, partition) do
    partition
    |> String.split("", trim: true)
    |> Enum.reduce(Enum.into(seats, []), fn elem, acc ->
      middle = round(length(acc) / 2)

      cond do
        elem in ["F", "L"] -> Enum.slice(acc, 0..(middle - 1))
        elem in ["B", "R"] -> Enum.slice(acc, middle..length(acc))
      end
    end)
    |> List.first()
  end
end
