defmodule LychrelNumbers.ProblemSolver do
  use GenStage

  def start_link do
    GenStage.start_link(__MODULE__, :state)
  end

  def init(state) do
    IO.puts "Consumer"
    {:consumer, state, subscribe_to: [LychrelNumbers.ProblemStore]}
  end

  def handle_events(events, _from, state) do
    for event <- events do
      IO.inspect event
    end

    {:noreply, [], state}
  end
end
