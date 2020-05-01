defmodule Sequence.Stack do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def push(item) do
    GenServer.cast(__MODULE__, {:push, item})
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  #Genserver implications

  def init(_) do
    {:ok, Sequence.StackStash.get()} 
  end

  def handle_call(:pop, _, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_cast({:push, pushing}, state) do
    {:noreply, [pushing | state]}
  end

  def terminate(_reason, current_stack) do
    Sequence.StackStash.update(current_stack)
  end
end
