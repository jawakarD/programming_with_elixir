defmodule Sum do
  def values(dict) do
    dict |> Dict.values |> Enum.sum
  end
end
