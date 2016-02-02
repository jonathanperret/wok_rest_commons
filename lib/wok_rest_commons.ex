defmodule WokRESTCommons do
  defmacro __using__(_opts) do
    quote do
      import WokRESTCommons.RequestParser
      alias WokRESTCommons.Response
      import WokRESTCommons.JSONAPIResponseRenderer
    end
  end
end
