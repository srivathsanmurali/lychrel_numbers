defmodule LychrelNumbers.LychrelSolver do
  @maxCount 25
 
  def reverse_number (number) do
    number
    |> Integer.digits
    |> Enum.reverse
    |> Integer.undigits
  end

  def palindrome?(number) do
    reverse_number(number) === number
  end

  def lychrel_search(number) do
    lychrel_search(number, number, 0)
  end

  def lychrel_search(number, original, count) when count < @maxCount do
    number
    |> palindrome?
    |> case do
      true -> {:completed, original, number, count}
      false -> number
                |> reverse_number
                |> sum(number)
                |> lychrel_search(original, count+1)
    end
  end

  def lychrel_search(number, original, count) when count >= @maxCount do
    {:out_of_limit, original, number, count}
  end

  def sum(x,y) do x + y end
end
