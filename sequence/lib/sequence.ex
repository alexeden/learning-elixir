defmodule Sequence do
  use Application

  def start(type, args) do
    IO.puts "start type: " <> inspect type
    IO.puts "start args: " <> inspect args

    # Start the Stash worker first
    {:ok, _pid} = Sequence.Supervisor.start_link(Application.get_env(:sequence, :initial_value))
  end
end
