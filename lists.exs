defmodule Lists do

  def len([]), do: 0
  def len([_head | tail]), do: 1 + len tail

  def square([]), do: []
  def square([n | tail]), do: [ n*n | square tail ]

  # usage: Lists.map [1, 2, 3, 4], fn n -> n*n end
  # usage: Lists.map [1, 2, 3, 4], &(&1 * &1)
  def map([], _f), do: []
  def map([head | tail], f), do: [ f.(head) | map(tail, f) ]

  def sum([]), do: 0
  def sum([head | tail]), do: head + sum tail

  # usage: Lists.mapsum [1, 2, 3], &(&1 * &1)
  def mapsum(list, f), do: sum map(list, f)

  # syntax: reduce(collection, initial_value, func)
  # usage: Lists.reduce [1, 2, 3, 4], 0, &(&1 + &2)
  def reduce([], value, _f), do: value
  def reduce([head | tail], value, f), do: reduce(tail, f.(value, head), f)

  # usage: Lists.max [100, -1, 50, 10]
  def max([m1]), do: m1
  def max([m1, m2 | tail]) when m1 < m2, do: max([m2 | tail])
  def max([m1, m2 | tail]) when m1 >= m2, do: max([m1 | tail])
  def max([]), do: raise "Can't find the maximum value of an empty list!"

  # usage: Lists.span(1, 10)
  def span(from, to) when from > to, do: span(to, from)
  def span(to, to), do: [to]
  def span(from, to), do: [from | span(from + 1, to)]


end
