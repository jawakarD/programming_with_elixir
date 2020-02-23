defmodule Duper.Results do
  use GenServer

  @me __MODULE__

  def start_link(_) do
   GenServer.start_link(__MODULE__, :no_args, name: @me) 
  end 

  def add_hast_for(path, hash) do
   GenServer.cast(@me, {:add, path, hash}) 
  end

  def find_duplicates() do
   GenServer.call(@me, :find_duplicates) 
  end

  #server
  def init(:no_args) do
    {:ok, %{}}
  end

  def handle_cast({:add, path, hash}, results) do
    results = 
      Map.update(
        results,
        hash,
        [path],
        fn existing -> 
          [path | existing]
        end)
    {:no_reply, results}
  end

  def handle_call(:find_duplicates, _from, results) do
    {
      :reply,
      hashes_with_more_than_one_path(results),
      results
    } 
  end

  def hashes_with_more_than_one_path(results) do
    results
    |> Enum.filter(fn {_hash, path} -> length(path) > 1 end)
    |> Enum.map(&elem(&1, 1)) 
  end
end