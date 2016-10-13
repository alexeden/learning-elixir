# usage:
# elixir --erl "+P 1000000" -r spawn_chain.ex -e "SpawnChain.run(1_000_000)"

defmodule SpawnChain do
  def counter(next_pid) do
    receive do n -> send next_pid, n + 1 end
  end

  def create_processes(n) do
    # Spawn n processes and reference the pid of the last
    last_pid = Enum.reduce 1..n, self,
      fn _, send_to ->
        spawn SpawnChain, :counter, [send_to]
      end

    send last_pid, 0

    receive do
      final_value -> "#{final_value} processes"
    end
  end

  def run(n) do
    IO.puts inspect :timer.tc(SpawnChain, :create_processes, [n])
  end

end
