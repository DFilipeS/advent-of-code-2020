defmodule Day4Test do
  use ExUnit.Case

  test "running validate/2 with example 1 input returns 2" do
    path = Path.relative_to_cwd("priv/example1.txt")
    assert Day4.validate(path, :format) == 2
  end

  test "running validate/2 with problem input input returns 256" do
    path = Path.relative_to_cwd("priv/input.txt")
    assert Day4.validate(path, :format) == 256
  end

  test "running validate/2 with example 2 input returns 4" do
    path = Path.relative_to_cwd("priv/example2.txt")
    assert Day4.validate(path, :data) == 4
  end

  test "running validate/2 with problem input returns 198" do
    path = Path.relative_to_cwd("priv/input.txt")
    assert Day4.validate(path, :data) == 198
  end
end
