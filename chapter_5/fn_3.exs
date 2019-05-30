handle_rem = fn
  a -> handle_fizz(rem(a, 3), rem(a, 5), a)
end

