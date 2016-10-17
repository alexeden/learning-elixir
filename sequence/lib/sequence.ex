defmodule Sequence do
  use Application

  def start(_type, _args) do
    # Start the Stash worker first
    {:ok, _pid} = Sequence.Supervisor.start_link(123)
  end
end
