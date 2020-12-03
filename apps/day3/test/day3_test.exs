defmodule Day3Test do
  use ExUnit.Case

  test "running tree_count/1 with example input returns 7" do
    path = Path.relative_to_cwd("priv/example.txt")
    assert Day3.tree_count(path, right: 3, down: 1) == 7
  end

  test "running tree_count/1 with problem input returns 198" do
    path = Path.relative_to_cwd("priv/input.txt")
    assert Day3.tree_count(path, right: 3, down: 1) == 198
  end

  test "running analyze_all_slopes/1 with example input returns 336" do
    path = Path.relative_to_cwd("priv/example.txt")
    assert Day3.analyze_all_slopes(path) == 336
  end

  test "running analyze_all_slopes/1 with problem input returns 5140884672" do
    path = Path.relative_to_cwd("priv/input.txt")
    assert Day3.analyze_all_slopes(path) == 5_140_884_672
  end
end
