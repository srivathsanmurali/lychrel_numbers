defmodule LychrelNumbers.ProblemSolver do
  use GenStage
  alias LychrelNumbers.LychrelSolver

  def start_link do
    GenStage.start_link(__MODULE__, :state)
  end

  def init(state) do
    IO.puts "Consumer"
    {:consumer, state, subscribe_to: [{LychrelNumbers.ProblemStore, min_demand: 10, max_demand: 20}]}
  end

  def handle_events(events, _from, state) do
    for event <- events do
      IO.inspect LychrelSolver.lychrel_search(event)
    end

    {:noreply, [], state}
  end
end
