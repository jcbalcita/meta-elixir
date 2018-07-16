defmodule Debugger do

  @doc """
  Oops, because we didn't use `bind_quoted`, we unquoted the expression twice!
  """
  defmacro bad_log(expression) do
    if Application.get_env(:debugger, :log_level) == :debug do
      quote do
        IO.puts ​"================="​
        IO.inspect unquote(expression)
        IO.puts ​"================="​
      end
    else
      unquote(expression) # !
    end
  end

  defmacro log(expression) do
    if Application.get_env(:debugger, :log_level) == :debug do
      quote bind_quoted: [expression: expression] do
        IO.puts ​"================="​
        IO.inspect expression
        IO.puts ​"================="​
      end
    else
      expression
    end
  end
end