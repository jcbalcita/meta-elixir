defmodule MacroOne do
  defmacro unless(expression, do: block) do
    quote do
      case unquote(expression) do
        x when x in [nil, false] -> unquote(block)
        _ -> nil
      end
    end
  end

  defmacro raw(expression) do
    Macro.escape(expression)
  end
end
