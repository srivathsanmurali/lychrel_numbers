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
    lychrel_search(number, [number], 0)
  end

  def lychrel_search(number, trace, count) when count < @maxCount do
    trace = trace ++ [number]
    {:ok, original} = Enum.fetch(trace, 0)
    number
    |> palindrome?
    |> case do
      true -> {:completed, original, trace, count}
      false -> number
                |> reverse_number
                |> sum(number)
                |> lychrel_search(trace, count+1)
    end
  end

  def lychrel_search(_number, trace, count) when count >= @maxCount do
    {:ok, original} = Enum.fetch(trace, 0)
    {:out_of_limit, original, trace, count}
  end

  def sum(x,y) do x + y end
end
