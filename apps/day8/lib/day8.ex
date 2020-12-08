defmodule Day8 do
  @moduledoc """
  Documentation for `Day8` problems.

  Source: https://adventofcode.com/2020/day/8
  """

  def find_loop(path) do
    path
    |> read_input()
    |> execute(0, 0)
  end

  def fix_loop(path) do
    operations = read_input(path)

    operations
    |> Enum.with_index()
    |> Enum.reduce_while(nil, fn
      {step, index}, acc when step.operation in ["jmp", "nop"] ->
        operations
        |> List.replace_at(index, flip_operation(step))
        |> execute(0, 0)
        |> case do
          {:ok, _value} = result -> {:halt, result}
          _ -> {:cont, acc}
        end

      {_step, _index}, acc ->
        {:cont, acc}
    end)
  end

  defp read_input(path) do
    path
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_operation/1)
  end

  defp parse_operation(operation) do
    [op_code, value] = String.split(operation, " ", trim: true)

    %{operation: op_code, value: String.to_integer(value)}
  end

  defp execute(operations, program_counter, acc, executed_operations \\ []) do
    cond do
      program_counter in executed_operations ->
        {:error, acc}

      program_counter >= length(operations) ->
        {:ok, acc}

      true ->
        execute_step(operations, program_counter, acc, executed_operations)
    end
  end

  defp execute_step(operations, program_counter, acc, executed_operations) do
    step = Enum.at(operations, program_counter)
    executed_operations = executed_operations ++ [program_counter]

    case step.operation do
      "acc" ->
        execute(
          operations,
          program_counter + 1,
          acc + step.value,
          executed_operations
        )

      "jmp" ->
        execute(operations, program_counter + step.value, acc, executed_operations)

      "nop" ->
        execute(operations, program_counter + 1, acc, executed_operations)
    end
  end

  defp flip_operation(%{operation: "jmp"} = step), do: Map.put(step, :operation, "nop")
  defp flip_operation(%{operation: "nop"} = step), do: Map.put(step, :operation, "jmp")
  defp flip_operation(step), do: step
end
