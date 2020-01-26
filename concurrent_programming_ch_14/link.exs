defmodule Link do
  def sad_function do
    :timer.sleep(500)
    exit(:boom)
  end

  def run do
    Process.flag(:trap_exit, true)
    spawn(Link, :sad_function, [])

    receive do
      msg -> 
        "Message received #{msg}"
      after 1000 ->
        "Nothing happened"
    end
  end
end

