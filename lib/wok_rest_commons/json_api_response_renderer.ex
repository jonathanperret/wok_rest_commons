defmodule WokRESTCommons.JSONAPIResponseRenderer do
  def respond_with(response, state) do
    {response.status_code, response.headers, response.body, state}
  end
end
