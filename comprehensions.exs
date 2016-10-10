defmodule Comprehensions do
  # comprehension syntax:
  # for generator or filter... [, into: value ], do: expression
  def span(from, to) do
    for x <- from..to, do: x
  end

end
