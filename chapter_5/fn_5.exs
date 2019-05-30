a = Enum.map([1,2,4,5], &(&1 + 2))
Enum.each(a, &IO.inspect&1)

