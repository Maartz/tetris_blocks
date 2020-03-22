defmodule Tetris.BrickTest do
  use ExUnit.Case

  import Tetris.Brick
  import Tetris.Points

  test "Creates a new brick" do
    assert new_brick().name == :i
    assert new_brick().reflection == false

    refute new_brick().location == {0, 0}
  end

  test "Creates a new random brick" do
    actual = new_random_brick()

    assert actual.name in [:i, :l, :z, :t, :o]
    assert actual.rotation in [0, 90, 180, 270]
    assert actual.reflection in [true, false]
  end

  test "should manipulate brick" do
    actual =
      new_brick()
      |> left()
      |> right()
      |> right()
      |> down()
      |> spin_90()
      |> spin_90()

    assert actual.location == {41, 1}
    assert actual.rotation == 180
  end

  test "should return points for i shape" do
    points =
      new_brick(name: :i)
      |> shape()

    assert {2, 1} in points
    assert {2, 2} in points
  end

  test "should translate a list point" do
    brick =
      new_brick(name: :o)
      |> shape()
      |> translate({1, 1})

    assert brick == [{3, 3}, {4, 3}, {3, 4}, {4, 4}]
  end

  def new_brick(attributes \\ []), do: new(attributes)
  def new_random_brick, do: new_random()
end
