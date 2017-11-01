defmodule LychrelSolverTest do
  use ExUnit.Case

  alias LychrelNumbers.LychrelSolver
  test "the reverse digits test" do
    assert (LychrelSolver.reverse_number(123)) == 321
  end

  test "palindrome check" do
    assert LychrelSolver.palindrome?(123) == false
    assert LychrelSolver.palindrome?(121) == true
  end
end
