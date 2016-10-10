defmodule Guard do
  def what_is(x) when Kernel.is_string(x) do
    IO.puts "#{x} is a string"
  end

end
