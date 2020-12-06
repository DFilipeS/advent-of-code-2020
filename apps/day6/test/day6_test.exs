defmodule Day6Test do
  use ExUnit.Case

  test "total_affirmative/2 for :any with example 1 input returns 6" do
    path = Path.relative_to_cwd("priv/example1.txt")
    assert Day6.total_affirmative(path, :any) == 6
  end

  test "total_affirmative/2 for :any with example 2 input returns 11" do
    path = Path.relative_to_cwd("priv/example2.txt")
    assert Day6.total_affirmative(path, :any) == 11
  end

  test "total_affirmative/2 for :any with problem input returns 6590" do
    path = Path.relative_to_cwd("priv/input.txt")
    assert Day6.total_affirmative(path, :any) == 6590
  end

  test "total_affirmative/2 for :all with example 1 input returns 3" do
    path = Path.relative_to_cwd("priv/example1.txt")
    assert Day6.total_affirmative(path, :all) == 3
  end

  test "total_affirmative/2 for :all with example 2 input returns 6" do
    path = Path.relative_to_cwd("priv/example2.txt")
    assert Day6.total_affirmative(path, :all) == 6
  end

  test "total_affirmative/2 for :all with problem input returns 3288" do
    path = Path.relative_to_cwd("priv/input.txt")
    assert Day6.total_affirmative(path, :all) == 3288
  end
end
