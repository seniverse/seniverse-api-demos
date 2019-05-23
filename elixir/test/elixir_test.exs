defmodule ElixirTest do
  use ExUnit.Case
  doctest Elixir

  test "greets the world" do
    assert Elixir.hello() == :world
  end
end
