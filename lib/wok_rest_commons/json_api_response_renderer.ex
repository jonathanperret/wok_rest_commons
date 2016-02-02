defmodule JSONAPIResponseRenderer do
  def render_response(response, state) do
    {response.status_code, response.body, response.headers, state}
  end
end