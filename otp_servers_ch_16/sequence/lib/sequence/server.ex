defmodule Sequence.Server do
  use GenServer

  def start_link(current_number) do
    GenServer.start_link(__MODULE__, current_number, name: __MODULE__)
  end

  def start_stack_process(stack) do
    GenServer.start_link(__MODULE__, stack, name: :stack)
  end

  def next_number do
    GenServer.call(__MODULE__, :next_number)
  end

  def increment_number(delta) do
    GenServer.cast(__MODULE__, {:increment, delta})
  end

  def push(item) do
    GenServer.cast(:stack, {:push, item})
  end

  def pop do
    GenServer.call(:stack, :pop)
  end

  def handle_call(:next_number, _from, current_number) do
    {:reply, current_number, current_number + 1}
  end

  def handle_cast({:increment, delta}, current_number) do
    {:noreply, current_number + delta}
  end

  def handle_call({:set_number, new_number}, _from, _current_number) do
    {:reply , new_number, new_number}
  end

  def handle_call({:square, number}, _, _) do
    {:reply, {:square_of, number, number * number}, []}
  end

  def handle_call(:pop, _, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_cast({:push, pushing}, state) do
    {:noreply, [pushing | state]}
  end

  def format_status(_reason, [_pdict, state]) do
    [data: [{'State', "My current state is '#{inspect state}', i'm Happy"}]]
  end

  def terminate(reason, state) do
    IO.puts "Terminatingi because of #{inspect reason}, with state #{inspect state}"
  end
end


