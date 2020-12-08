defmodule Day8Test do
  use ExUnit.Case

  test "find_loop/1 with example input returns 5" do
    path = Path.relative_to_cwd("priv/example.txt")
    assert Day8.find_loop(path) == {:error, 5}
  end

  test "find_loop/1 with problem input returns 1675" do
    path = Path.relative_to_cwd("priv/input.txt")
    assert Day8.find_loop(path) == {:error, 1675}
  end

  test "fix_loop/1 with example input returns 8" do
    path = Path.relative_to_cwd("priv/example.txt")
    assert Day8.fix_loop(path) == {:ok, 8}
  end

  test "fix_loop/1 with problem input returns 1532" do
    path = Path.relative_to_cwd("priv/input.txt")
    assert Day8.fix_loop(path) == {:ok, 1532}
  end
end
