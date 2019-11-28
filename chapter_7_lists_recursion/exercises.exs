defmodule Mylist do
  def mapsum(arr, func), do: _mapsum(arr, func, 0)
  defp _mapsum([], _func, value), do: value
  defp _mapsum([head | tail], func, value), do: _mapsum(tail, func, func.(head, value))

  def max([head | tail]), do: _max(tail, head)

  defp _max([], value), do: value
  defp _max([head | tail], value), do: if head > value, do: _max(tail, head), else: _max(tail, value)

  def ceaser(arr, n), do: _ceaser(arr, n, '')

  def _ceaser([], _n, current_value), do: current_value
  def _ceaser([head | tail], n, current_value) do
    new_value = 
      case head + n do
        new_char when new_char > 90 -> new_char - 26
        new_char when new_char < 91 -> new_char
      end
    _ceaser(tail, n, current_value ++ [new_value])
  end

end
