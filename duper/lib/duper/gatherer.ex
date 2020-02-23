defmodule Duper.Gatherer do
  use GenServer
  @me Gatherer

  def start_link(woker_count) do
    GenServer.start_link(__MODULE__, woker_count, @me)
  end

  def done() do
    GenServer.cast(@me, :done)
  end

  def result(path, hash) do
    GenServer.cast(@me, {:result, path, hash})
  end

  def init(worker_count) do
    Process.send_after(self(), :kickoff, 0)
    {:ok, worker_count}
  end

  def handle_info(:kickoff, worker_count) do
    1..worker_count
    |> Enum.each(fn _ -> Duper.WorkerSupervisor.add_worker() end)

    {:noreply, worker_count}
  end

  def handle_cast(:done, _worker_count = 1) do
    report_result()
    System.halt(0)
  end

  def handle_cast(:done, worker_count) do
    {:noreply, worker_count - 1}
  end

  def handle_cast({:result, path, hash}) do
    Duper.Results.add_hash_for(path, hash)
  end

  def report_result() do
    IO.puts("Results:\n")

    Duper.Results.find_duplicates()
    |> Enum.each(&IO.inspect/1)
  end
end
