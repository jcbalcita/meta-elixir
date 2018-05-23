defmodule MacroTwo do
@moduledoc """
Custom language constructs
"""

defmodule LoopOne do
  @doc """
  Never-ending loop!
  """
  defmacro while(expression, do: block) do
    quote do
      for _ <- Stream.cycle([:ok]) do
        if unquote(expression), do: unquote(block)
      end
    end
  end
end

defmodule LoopTwo do
  @doc """
  A b-boy loop.
  """
  defmacro while(expression, do: block) do
    quote do
      try do
        for _ <- Stream.cycle([:ok]) do
          case unquote(expression) do
            x when x in [nil, false] -> break()
            _ -> unquote(expression)
          end
        end
      catch
        :break -> :ok
      end
    end
  end

  def break, do: throw :break
end

end