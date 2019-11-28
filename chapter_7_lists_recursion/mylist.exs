defmodule MyList do
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)
  def square([]), do: []
  def square([ head | tail ]), do: [ head * head | square(tail) ]
  def add_1([]), do: []
  def add_1([ head | tail]), do: [head + 1 | add_1(tail)]
	def map([], _func), do: []
	def map([head | tail], func), do: [ func.(head) | map(tail, func) ]
	def sum(list), do: _sum(list, 0)
	defp _sum([], total), do: total
	defp _sum([head | tail], total), do: _sum(tail, head+total)

  def span(from, to), do: [from | _span(to, from)]
  
  defp _span(to, last_number) when to == last_number do
    []
  end

  defp _span(to, last_number) do
    [last_number + 1 | _span(to, last_number + 1)]
  end

end
