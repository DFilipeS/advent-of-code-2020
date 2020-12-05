defmodule Day5Test do
  use ExUnit.Case

  test "parse_seat/1 with FBFBBFFRLR returns row 44 and column 5" do
    assert %{id: 357, row: 44, column: 5} = Day5.parse_seat("FBFBBFFRLR")
  end

  test "parse_seat/1 with BFFFBBFRRR returns row 70 and column 7" do
    assert %{id: 567, row: 70, column: 7} = Day5.parse_seat("BFFFBBFRRR")
  end

  test "parse_seat/1 with FFFBBBFRRR returns row 14 and column 7" do
    assert %{id: 119, row: 14, column: 7} = Day5.parse_seat("FFFBBBFRRR")
  end

  test "parse_seat/1 with BBFFBBFRLL returns row 102 and column 4" do
    assert %{id: 820, row: 102, column: 4} = Day5.parse_seat("BBFFBBFRLL")
  end

  test "parse_seat/1 with BBBBBBBRRR returns row 127 and column 7" do
    assert %{id: 1023, row: 127, column: 7} = Day5.parse_seat("BBBBBBBRRR")
  end

  test "max_id/1 with example input returns 820" do
    path = Path.relative_to_cwd("priv/example1.txt")
    assert Day5.max_id(path) == 820
  end

  test "max_id/1 with problem input returns 822" do
    path = Path.relative_to_cwd("priv/input.txt")
    assert Day5.max_id(path) == 822
  end

  test "find_missing/1 with problem input returns 705" do
    path = Path.relative_to_cwd("priv/input.txt")
    assert Day5.find_missing(path) == 705
  end
end
