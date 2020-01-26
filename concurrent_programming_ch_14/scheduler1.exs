defmodule Scheduler do
  def run(num_of_processes, module, function, to_calculate, word) do
    (1..num_of_processes)
    |> Enum.map(fn (_) -> spawn(module, function, [self()]) end)
    |> schedule_processes(to_calculate, word, [])
  end

  def schedule_processes(processes, to_calculate, word, results) do
    receive do
      {:ready, pid} when to_calculate != []  ->
        [next | tail] = to_calculate
        send(pid, {:find, next, word, self()})
        schedule_processes(processes, tail, word, results)

      {:ready, pid} ->
        send(pid, {:shutdown})

        if length(processes) > 1 do
          schedule_processes(List.delete(processes, pid), to_calculate, word, results)
        else
          Enum.sort(results, fn {n1, _}, {n2, _} -> n1 <= n2 end)
        end

      {:answer, file, result, _pid} -> 
        schedule_processes(processes, to_calculate, word, [{file, result} | results])
    end
  end

  def main do
    directory = "."

    files = 
      File.ls!(directory)
      |> Enum.filter(fn x -> !File.dir?(x) end)
    IO.inspect files

    Enum.each 1..100, fn num_processes ->
      {time, result} = :timer.tc(Scheduler, :run,
        [num_processes, FindCat, :find, files, "end"])
      if num_processes == 1 do 
        IO.puts inspect result
        IO.puts "\n # time (s)"
      end

      :io.format "~2B ~.2f~n", [num_processes, time/1000000.0]
    end
  end
end
        

