defmodule Sequence.Stash do
  use GenServer

  @me __MODULE__

  alias Sequence.Server.Stash

  def start_link(%State{} = state) do
    GenServer.start_link(__MODULE__, state, name: @me)
  end

  def update(%State{} = state) do
    GenServer.cast(@me, {:update, state})
  end

  def get() do
    GenServer.call(@me, {:get})
  end

  # Server implementation

  def init(init_state) do
    {:ok, init_state}
  end

  def handle_call({:get}, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:update, new_state}, _state) do
    {:noreply, new_state}
  end
end
