defmodule Customer do

  defstruct name: "", company: ""

end

defmodule BugReport do

  defstruct owner: %{}, details: "", severity: 1

end

languages_with_an_r =  fn (:get, collection, next_fn) ->
 for row <- collection do
  if String.contains?(row.language, "r") do
    next_fn(row)
  end
 end
end
