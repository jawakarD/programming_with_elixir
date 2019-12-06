defmodule MyList do

  def all([], _), do: true
  def all([head | tail], f) do
    if f.(head), do: all(tail, f), else: false
  end
  
  def each([], _), do: :ok
  def each([head | tail], f) do
    f.(head)
    each(tail, f)
  end

  def filter([], _), do: []
  def filter([head | tail], f)  do
    if f.(head) do
      [head | filter(tail, f)]
    else
      filter(tail, f)
    end
  end

  def split(list, place), do: _split(list, place, 0, [], [])

  def _split([], _, _, first, last), do: [first, last] 
  def _split([head | tail], place, index, first, second) do
    if (index < place) do
      _split(tail, place, index + 1, first ++ [head], second) 
    else
      _split(tail, place, index + 1, first, second ++ [head])
    end
  end 

  # Implement take for negative value
  def take(list, place), do: _take(list, place, 0, [])
  def _take([], _, _, return), do: return
  def _take([head | tail], place, index, taken) do
    if (index < place) do
      _take(tail, place, index + 1, taken ++ [head])
    else
      _take([], place, index + 1, taken)
    end
  end

  def flatten(list), do: do_flatten(list, [])

  defp do_flatten([h | t], acc) when not is_list(h), do: do_flatten(t, [h | acc])
  defp do_flatten([h | t], acc) when is_list(h), do
    acc ++ do_flatten(h, acc) ++ do_flatten(t, acc)
  end
  defp do_flatten([], acc), do: Enum.reverse acc
end
