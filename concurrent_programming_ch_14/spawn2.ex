defmodule Spawn2 do
  def greet do
    receive do
      {sender, msg} ->
        send(sender, {:ok, "Hello, #{msg}"})
      end
    end
end

#client
pid = spawn(Spawn2, :greet, [])
send(pid, {self(), "World"})
receive do
  {:ok, message} ->
    IO.puts message
end


send(pid, {self(), "Karki"})
receive do
  {:ok, message} ->
    IO.puts message
end
