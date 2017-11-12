defmodule LychrelNumbers.ProblemSolver do
  alias LychrelNumbers.{LychrelSolver,Problem}

  def start_link(event) do
    Task.start_link(__MODULE__, :run_problem, [event])
  end

  def run_problem(event) do
      case LychrelSolver.lychrel_search(event.last_number) do
        {:completed, _original, trace, count} -> 
          {:ok, last_number} = Enum.fetch(trace, -1)
          Problem.update_problem(event.id, "completed", last_number, event.count + count)
        {:out_of_limit, _original, trace, count} ->
          {:ok, last_number} = Enum.fetch(trace, -1)
          IO.inspect {event, trace, last_number, count}
          Problem.update_problem(event.id, "free", last_number, event.count + count)
      end
      {:ok}
  end

end
