defmodule Link2 do
  def sad_function do
    :timer.sleep(500)
    exit(:boom)
  end

  def run do
    Process.flag(:trap_exit, true)
    spawn_link(Link2, :sad_function, [])

    receive do
      msg -> 
        "Message received #{inspect msg}"
      after 1000 ->
        "Nothing happened"
    end
  end
end

