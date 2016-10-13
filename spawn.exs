defmodule LearningSpawn do
  def sayHai do
    receive do
      {sender, msg} ->
        send sender, {:ok, "Oh hai, #{msg}!"}
        sayHai
    end
  end
end

# Create a client
pid = spawn LearningSpawn, :sayHai, []

send pid, {self, "Alex"}
receive do {:ok, msg} -> IO.puts msg end

send pid, {self, "Joey"}
receive do
  {:ok, msg} ->
    IO.puts msg
  after 500 ->
    IO.puts "He went bye-bye"
end
