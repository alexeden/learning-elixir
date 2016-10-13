defmodule ParallelMap do
  def pmap collection, f do
    me = self
    collection
      |>  Enum.map(fn elem ->
            spawn_link fn -> (send me, {self, f.(elem)}) end
          end)
      |>  Enum.map(fn pid ->
            receive do { ^pid, result } -> result end
          end)
  end
end
