defmodule Sequence.Stash do
  use GenServer

  @me __MODULE__

  def start_link(current_number) do
    GenServer.start_link(__MODULE__, current_number, name: @me)
  end

  def update(number) do
    GenServer.cast(@me, {:update, number})
  end

  def get() do
    GenServer.call(@me, {:get})  
  end

  #Server implementation

  def init(inital_number) do
    {:ok, inital_number} 
  end

  def handle_call({:get}, _from, current_number) do
    {:reply, current_number, current_number}
  end

  def handle_cast({:update, new_number}, _current_number) do
    {:noreply, new_number} 
  end
end
