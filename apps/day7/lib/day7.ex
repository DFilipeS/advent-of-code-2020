defmodule Day7 do
  @moduledoc """
  Documentation for `Day7` problems.

  Source: https://adventofcode.com/2020/day/7
  """

  def possible_bags(path, name) do
    path
    |> read_input()
    |> find_fit(name)
    |> length()
  end

  def total_bags(path, name) do
    path
    |> read_input()
    |> count_nested(name)
  end

  defp read_input(path) do
    path
    |> File.read!()
    |> String.split("\n", trim: true)
    |> parse_rules()
  end

  defp parse_rules(rules) do
    Enum.map(rules, fn rule ->
      reg = ~r/(?<name>.*) bags contain (?<contents>.*)./
      %{"name" => name, "contents" => contents} = Regex.named_captures(reg, rule)

      %{name: name, contents: parse_contents(contents)}
    end)
  end

  defp parse_contents("no other bags"), do: []

  defp parse_contents(contents) do
    contents
    |> String.split(", ", trim: true)
    |> Enum.map(fn elem ->
      reg = ~r/(?<amount>[0-9]*) (?<name>[a-z A-Z]*) bag|bags/
      %{"name" => name, "amount" => amount} = Regex.named_captures(reg, elem)

      %{name: name, amount: String.to_integer(amount)}
    end)
  end

  defp find_fit(rules, name) do
    rules
    |> Enum.filter(&contains_bag?(&1, name))
    |> Enum.map(& &1.name)
    |> case do
      [] -> []
      bags -> bags ++ Enum.flat_map(bags, &find_fit(rules, &1))
    end
    |> Enum.uniq()
  end

  defp contains_bag?(bag, name) do
    Enum.find(bag.contents, &(&1.name == name))
  end

  defp count_nested(rules, name) do
    rules
    |> Enum.find(&(&1.name == name))
    |> Map.get(:contents)
    |> Enum.reduce(0, fn bag, counter ->
      counter + (1 + count_nested(rules, bag.name)) * bag.amount
    end)
  end
end
