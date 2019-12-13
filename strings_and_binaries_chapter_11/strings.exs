defmodule Parse do
  
  def number([?- | tail]), do: _number_digits(tail, 0) * -1
  def number([?+ | tail]), do: _number_digits(tail, 0)
  def number(str), do: _number_digits(str, 0)

  defp _number_digits([], value), do: value

  defp _number_digits([digit | tail], value) when digit in '0123456789' do
     _number_digits(tail, value*10 + digit - ?0)
  end

  defp _number_digits([non_digit | _ ], _) do
    raise  "Invalid digit '#{[non_digit]}'"
  end

  def center(list) do
    longest = Enum.reduce(list, 0, fn x, acc -> 
      length = String.length(x)
      if length > acc do
        length
      else
        acc
      end
    end)
    IO.inspect longest

    list
    |> Enum.map(fn x -> if longest > String.length(x), do: String.pad_leading(x, div(longest - String.length(x),2) + String.length(x)), else: x end) 
    |> Enum.each(fn x -> IO.puts x end)
   end

   def capitalise_sentance(str) do
     split = String.split(str, ".\s")

     split
     |> Enum.map(&String.capitalize/1)
     |> Enum.join(".\s")
   end

   #Next exer ans
   #File.read!("amount.txt") |> String.split |> Enum.map(&String.split(&1,","))
end

