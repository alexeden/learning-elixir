defmodule Streams do
  def say(text) do
    spawn fn -> :os.cmd('say #{text}') end
  end

end
