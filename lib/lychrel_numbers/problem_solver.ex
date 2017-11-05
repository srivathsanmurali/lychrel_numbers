defmodule LychrelNumbers.ProblemSolver do
  alias LychrelNumbers.LychrelSolver

  def start_link(event) do
    Task.start_link(fn ->
      #IO.inspect {self(), LychrelSolver.lychrel_search(event)}
      LychrelSolver.lychrel_search(event)
      {:ok}
    end)
  end
end
