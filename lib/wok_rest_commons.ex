defmodule WokRestCommons do
  defmacro __using__(_opts) do
    quote do
      import WokRestCommons.RequestParser
      alias WokRestCommons.Response
      import WokRestCommons.JSONAPIResponseRenderer
    end
  end
end
