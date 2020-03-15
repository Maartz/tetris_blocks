defmodule Tetris.Points do

  def translate(points, {x, y}) do
    Enum.map(points, fn {dx, dy} -> {dx + x, dy + y} end)
    # Enum.map(points, &(&1 + x, &2 + y))
  end
end
