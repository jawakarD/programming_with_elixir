defmodule Monitor do
  def sad_method do
    :timer.sleep(500)
    exit(:boom)
  end

  def run do
    res = spawn_monitor(Monitor, :sad_method, [])
    IO.puts inspect res
    receive do
      msg ->
        IO.puts "message received #{inspect msg}"
    after 1000 ->
        IO.puts "Nothing happened"
    end
  end
end

