defmodule Spawn5 do
  def greet do
    receive do
      {sender, msg} ->
        send(sender, {:ok, "Hello, #{msg}"})
      end
    end
end

#client
pid = spawn(Spawn5, :greet, [])
pid2 = spawn(Spawn5, :greet, [])

send(pid, {self(), "World"})
send(pid2, {self(), "Mars"})

receive do
  {:ok, message} ->
    IO.puts message
end


receive do
  {:ok, message} ->
    IO.puts message
end
