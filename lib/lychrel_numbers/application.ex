defmodule LychrelNumbers.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    
    children = [
      worker(LychrelNumbers.ProblemStore, [0]),
    ]
    consumers =
      for id <- 1..System.schedulers_online*2 do
        worker(LychrelNumbers.ProblemSolver, [], id: id)
      end 

    opts = [strategy: :one_for_one, name: __MODULE__]
    Supervisor.start_link(children ++ consumers, opts)
  end
end
