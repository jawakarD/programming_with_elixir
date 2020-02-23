defmodule Duper.ResultsTest do
  use ExUnit.Case
  alias Duper.Results

  test "can add entries to the result" do

    Results.add_hast_for("path1", 123)
    Results.add_hast_for("path2", 023)
    Results.add_hast_for("path3", 923)
    Results.add_hast_for("path4", 223)
    Results.add_hast_for("path5", 223)
    Results.add_hast_for("path6", 123)
    Results.add_hast_for("path7", 923)
    Results.add_hast_for("path8", 123)

    duplicates = Results.find_duplicates()

    assert length(duplicates) == 2
    assert ~w{path8 path6 path1} in duplicates
    assert ~w{path4 path5} in duplicates
    assert ~w{path3 path7} in duplicates
  end 
end
