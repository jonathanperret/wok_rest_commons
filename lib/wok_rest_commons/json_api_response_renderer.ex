defmodule WokRESTCommons.JSONAPIResponseRenderer do
  alias WokRESTCommons.Response
  def respond_with(%Response{} = response, state) do
    {response.status_code, response.headers, response.body, state}
  end
end
