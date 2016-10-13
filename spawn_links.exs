defmodule SpawnLinks do
  import :timer, only: [sleep: 1]

  def sleepy_time do
    sleep 500
    exit :boom
  end

  def runLinked do
    Process.flag :trap_exit, true
    spawn_link SpawnLinks, :sleepy_time, []
    receive do
      msg ->
        IO.puts "Something happened! #{inspect msg}"
    after 1000 ->
      IO.puts "Nothing happened :("
    end
  end
  def runMonitored do
    res = spawn_monitor SpawnLinks, :sleepy_time, []
    IO.puts inspect res
    receive do
      msg ->
        IO.puts "Something happened! #{inspect msg}"
    after 1000 ->
      IO.puts "Nothing happened :("
    end
  end

end
