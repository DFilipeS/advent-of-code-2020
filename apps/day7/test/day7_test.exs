defmodule Day7Test do
  use ExUnit.Case

  test "possible_bags/2 with example input returns 4" do
    path = Path.relative_to_cwd("priv/example.txt")
    assert Day7.possible_bags(path, "shiny gold") == 4
  end

  test "possible_bags/2 with problem input returns 144" do
    path = Path.relative_to_cwd("priv/input.txt")
    assert Day7.possible_bags(path, "shiny gold") == 144
  end

  test "total_bags/2 with example 1 input returns 32" do
    path = Path.relative_to_cwd("priv/example.txt")
    assert Day7.total_bags(path, "shiny gold") == 32
  end

  test "total_bags/2 with example 2 input returns 126" do
    path = Path.relative_to_cwd("priv/example2.txt")
    assert Day7.total_bags(path, "shiny gold") == 126
  end

  test "total_bags/2 with problem input returns 5956" do
    path = Path.relative_to_cwd("priv/input.txt")
    assert Day7.total_bags(path, "shiny gold") == 5956
  end
end
