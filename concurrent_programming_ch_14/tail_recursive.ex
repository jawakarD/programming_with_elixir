defmodule TailRecursive do
  def factorial(n), do: _fact(n, 1)
  defp _fact(0, acc), do: acc
  defp _fact(n, acc), do: _fact(n-1, acc*n)
end

# this is not tail recursive
#
# def factorial(0), do: 1
# def factorial(n), do: n * factorial(n-1)
#
# Even though last function call is the same 
# fun it has to return to multiply with n
