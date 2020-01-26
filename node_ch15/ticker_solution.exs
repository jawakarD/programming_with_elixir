defmodule Ticker do

  @interval 2000 #2sec
  @name :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [[], nil])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send(:global.whereis_name(@name), {:register, client_pid})
  end

  def generator(clients, current) do
    receive do
      {:register, pid} ->
        IO.puts "registering #{inspect pid}"
        if is_nil(current) do
          generator([pid | clients], 0)
        else
          generator([pid | clients], current)
        end
    after @interval ->
      IO.puts "tick current: #{current}"
      cond  do
        current == nil -> generator(clients, current)
        current >= 0 && current < length(clients) -> 
          client = Enum.at(clients, current)
          send(client, {:tick})
          generator(clients, current + 1)
        true ->
          generator(clients, 0)
      end
    end
  end
end

defmodule Client do
  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Ticker.register(pid)
  end

  def receiver do
    receive do
      {:tick} ->
        IO.puts "tock in client"
        receiver()
    end
  end
end

