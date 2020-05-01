defmodule Sequence.Stash do
  use GenServer

  @me __MODULE__

  alias Sequence.Server.State

  def start_link(_) do
    init_number = Application.get_env(:sequence, :initial_number)
    init_delta = Application.get_env(:sequence, :initial_delta)

    GenServer.start_link(
      __MODULE__,
      %State{current_number: init_number, delta: init_delta},
      name: @me
    )
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
