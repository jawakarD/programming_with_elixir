defmodule WheatherHistory do
  def test_data do
    [

      [1,27,89,90],
      [12,34,45,66],
      [09,27,"ssda","asd"],
      [90,27,"asds",1001]
    ]  
  end

  def for_location_27([], _target_location), do: []

  def for_location_27([ head = [_, target_location, _, _] | tail], target_location) do
    [ head | for_location_27(tail, target_location) ]
  end

  def for_location_27([ _ | tail], target_location), do: for_location_27(tail, target_location)
end

