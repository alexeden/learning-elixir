defmodule Sequence do
  use Application

  def start(_type, _args) do
    # Start the Stash worker first
    {:ok, _pid} = Sequence.Supervisor.start_link(Application.get_env(:sequence, :initial_value))
  end
end
