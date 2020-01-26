defmodule Sequence.StackStash do
  use GenServer

  @me __MODULE__

  def start_link(current_stack) do
    GenServer.start_link(__MODULE__, current_stack, name: @me)
  end

  def update(stack) do
    GenServer.cast(@me, {:update, stack})
  end

  def get() do
    GenServer.call(@me, {:get})  
  end

  #Server implementation

  def init(inital_stack) do
    {:ok, inital_stack} 
  end

  def handle_call({:get}, _from, current_stack) do
    {:reply, current_stack, current_stack}
  end

  def handle_cast({:update, new_stack}, _current_number) do
    {:noreply, new_stack} 
  end
end
