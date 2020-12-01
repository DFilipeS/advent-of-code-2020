defmodule Day1Test do
  use ExUnit.Case

  test "run_part_1 with example input returns 514579" do
    path = Path.relative_to_cwd("priv/example.txt")
    assert Day1.run_part_1(path) == 514_579
  end

  test "run_part_1 with problem input returns 482811" do
    path = Path.relative_to_cwd("priv/input.txt")
    assert Day1.run_part_1(path) == 482_811
  end

  test "run_part_2 with example input returns 241861950" do
    path = Path.relative_to_cwd("priv/example.txt")
    assert Day1.run_part_2(path) == 241_861_950
  end

  test "run_part_2 with problem input returns 193171814" do
    path = Path.relative_to_cwd("priv/input.txt")
    assert Day1.run_part_2(path) == 193_171_814
  end
end
