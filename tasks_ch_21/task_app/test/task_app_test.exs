defmodule TaskAppTest do
  use ExUnit.Case
  doctest TaskApp

  test "greets the world" do
    assert TaskApp.hello() == :world
  end
end
