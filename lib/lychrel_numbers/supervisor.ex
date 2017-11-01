defmodule LychrelNumbers.Supervisor do
  use Supervisor

  def start_link do
    children = [
      worker(LychrelNumbers.ProblemStore, [0]),
    ]
    consumers =
      for id <- 1..System.schedulers_online*2 do
        worker(LychrelNumbers.ProblemSolver, [], id: id)
      end 

    Supervisor.start_link(children ++ consumers, strategy: :one_for_one)
  end
end
