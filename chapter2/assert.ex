defmodule Assertion do
  defmacro assert({operator, _, [lhs, rhs]}) do
    quote bind_quoted: [operator: operator, lhs: lhs, rhs: rhs] do
      Assertion.Test.assert(operator, lhs, rhs)
    end
  end

  @doc """
  Equivalent to Assertion.assert/1
  """
  defmacro assert_unbound({operator, _, [lhs, rhs]}) do
    quote do
      Assertion.Test.assert(unquote(operator), unquote(lhs), unquote(rhs))
    end
  end

  defmodule Assertion.Test do
    def assert(:==, lhs, rhs) when lhs == rhs, do: IO.write "."
    def assert(:==, lhs, rhs) do
      IO.puts """
      FAILURE:
        Expected:       #{lhs}
        to be equal to: #{rhs}
      """
    end

    def assert(:>, lhs, rhs) when lhs > rhs, do: IO.write "."
    def assert(:>, lhs, rhs) do
      IO.puts """
      FAILURE:
        Expected:           #{lhs}
        to be greater than: #{rhs}
      """
    end
  end
end