defmodule LychrelNumbers.ProblemSolver do
  use GenStage
  alias LychrelNumbers.LychrelSolver

  def start_link do
    GenStage.start_link(__MODULE__, :state)
  end

  def init(state) do
    IO.puts "Consumer"
    {:consumer, state, subscribe_to: [{{:global, :lychrelStore}, min_demand: 10, max_demand: 20}]}
  end

  def handle_events(events, _from, state) do
    events
    |> Enum.map(&LychrelSolver.lychrel_search/1)
    |> IO.inspect

    {:noreply, [], state}
  end
end
