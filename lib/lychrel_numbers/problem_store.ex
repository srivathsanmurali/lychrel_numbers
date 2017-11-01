defmodule LychrelNumbers.ProblemStore do
  use GenStage

  @name __MODULE__
  def start_link(counter) do
    IO.puts "Producer"
    GenStage.start_link(__MODULE__, counter, name: __MODULE__)
  end

  def init(counter) do
    {:producer, counter}
  end

  def handle_demand(demand, state) do
    events = Enum.to_list state..state+demand-1
    {:noreply, events, state+demand}
  end

end
