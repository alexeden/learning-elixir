defmodule Enums do

  # usage: Enums.all? [1, 2, 3, 4], &(&1 < 4)
  def all?([], _pred), do: true
  def all?([head | tail], pred), do: pred.(head) && all?(tail, pred)

  # usage: Enums.filter [1, 2, 3, 4], &(&1 < 4)
  def filter([], _pred), do: []
  def filter([head | tail], pred) do
    if pred.(head) == true do
      [head | filter(tail, pred)]
    else
      filter(tail, pred)
    end
  end

  def take(_list, 0), do: []
  def take([], _n), do: []   
  def take([head | tail], n) when n > 0, do: [head | take(tail, n - 1)]

end
