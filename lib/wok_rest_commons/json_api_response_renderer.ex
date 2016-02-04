defmodule WokRESTCommons.JSONAPIResponseRenderer do
  def respond_with(response), do: raise "2nd param(state) required "
  def respond_with(response, state) do
    {response.status_code, response.body, response.headers, state}
  end
end
