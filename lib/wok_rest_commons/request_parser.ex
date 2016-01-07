defmodule WokRestCommons.RequestParser do
  def parse_request(response, req) do
    decoded = req |> :cowboy_req.body |> decode_body_from_response
    case decoded do
      {:ok, decoded_body} -> %{response | decoded_body: decoded_body}
      {:error, _} -> %{response | status_code: 400}
    end
  end

  defp decode_body_from_response({:ok, body, _http_req}), do: Poison.decode(body)
  defp decode_body_from_response({:error, _}), do: {:error, 400}
end