defmodule Chop do
  defp find_middle_number_in_range(min..max) do
    min + div(max-min, 2)
  end

  defp do_guess(n, _range, guess) when guess == n do 
    IO.inspect guess
    guess
  end

  defp do_guess(n, _min..max, guess) when guess < n do 
    IO.inspect "Is it #{guess}"

    next_guess = find_middle_number_in_range(guess..max)
    do_guess(n, guess..max, next_guess)
  end
  
  defp do_guess(n, min.._max, guess) when guess > n do 
    IO.inspect "Is it #{guess}"

    next_guess = find_middle_number_in_range(min..guess)
    do_guess(n, min..guess, next_guess)
  end

  def guess(n, range) when is_integer(n) do
    guess = find_middle_number_in_range(range)
    do_guess(n, range, guess) 
  end
end
