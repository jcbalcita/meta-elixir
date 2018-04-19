defmodule Math do

  defmacro say({:+, _, [left, right]}) do
    quote do
      left = unquote(left)
      right = unquote(right)
      result = left + right

      IO.puts "#{left} plus #{right} equals #{result}"
      result
    end
  end

  defmacro say({:*, _, [left, right]}) do
    quote do
      left = unquote(left)
      right = unquote(right)
      result = left * right

      IO.puts "#{left} times #{right} equals #{result}"
      result
    end
  end

  defmacro say(_), do: IO.puts "No macro exists for this operator"

end