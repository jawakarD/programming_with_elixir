fizz_buzz = fn
  0, 0, c -> "FizzBuzz"
  0, b, c -> "Fizz"
  a, 0, c -> "Buzz"
  a, b, c -> c
end

IO.puts(fizz_buzz.(0, 0, 0))
IO.puts(fizz_buzz.(0, 1, 1))
IO.puts(fizz_buzz.(2, 0, 2))
IO.puts(fizz_buzz.(2, 20, :ssdf))
