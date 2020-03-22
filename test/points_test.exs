defmodule Tetris.PointsTest do
  use ExUnit.Case

  import Tetris.Points

  test "should flip rotate and mirror" do
    [{1, 1}]
    |> mirror
    |> assert_point({4, 1})
    |> flip
    |> assert_point({4, 4})
    |> rotate_90
    |> assert_point({1, 4})
    |> rotate_90
    |> assert_point({1, 1})
  end

  defp assert_point([actual], expected) do
    assert actual == expected
    [actual]
  end
end
