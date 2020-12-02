defmodule Day2Test do
  use ExUnit.Case

  test "running validate/1 for :sled_rental policy with the example input returns 2" do
    path = Path.relative_to_cwd("priv/example.txt")
    assert Day2.validate(path, :sled_rental) == 2
  end

  test "running validate/1 for :sled_rental policy with the input for problem returns 515" do
    path = Path.relative_to_cwd("priv/input.txt")
    assert Day2.validate(path, :sled_rental) == 515
  end

  test "running validate/1 for :otcas policy with the example input returns 1" do
    path = Path.relative_to_cwd("priv/example.txt")
    assert Day2.validate(path, :otcas) == 1
  end

  test "running validate/1 for :otcas policy with the input for problem returns 711" do
    path = Path.relative_to_cwd("priv/input.txt")
    assert Day2.validate(path, :otcas) == 711
  end
end
