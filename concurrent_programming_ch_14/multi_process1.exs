defmodule Multi3 do
  def sad_method(sender) do 
    send(sender, "Hello from child")
    # No exception in ex: 3
    raise RuntimeError
  end

  def receive_loop do
    receive do
      msg -> 
        IO.puts inspect  msg
        receive_loop()
    after 1000 ->
        IO.puts "All done"
    end
  end
end

#clien
#Ex: 3 and 4 
#span_link
spawn_monitor(Multi3, :sad_method, [self()])
:timer.sleep(2000)
Multi3.receive_loop()
