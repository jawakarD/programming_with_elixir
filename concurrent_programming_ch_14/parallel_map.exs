defmodule ParallelMap do
  def map(collection, fun) do

    # Ex: multi_processing -> 6
    # we use a differnt variable here because it runs on a different process
    # and the spawn_link created different process for each element
    me = self()
    IO.inspect me

    collection
    |> Enum.map(fn elm -> 
      spawn_link(fn -> 
        IO.inspect self()
        send(me, {self(), fun.(elm)})
      end)
    end)
    |> Enum.map(fn  pid ->
      receive do
        {^pid, res} -> res
      end
    end)

  end
end
