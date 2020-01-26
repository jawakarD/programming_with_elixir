defmodule FindCat do
  def find(sender) do
    send(sender, {:ready, self()})

    receive do
      {:find, file, word, client} ->
        send(client, {:answer, file, find_word(file, word), self()})
        find(sender)
      {:shutdown} ->
        exit(:normal)
    after 1000 -> 
        IO.puts ":("
    end
  end

  def find_word(file, word) do
    File.read!(file)
    |> String.split(["\n", " ", "\\"]) 
    |> Enum.filter(fn s -> String.length(s) > 0 end) 
    |> Enum.reduce(0, fn s, acc -> if s == word, do: acc + 1, else: acc end)
  end
end
