defmodule WokRESTCommons.RequestParser do
  def parse_request(response, req) do
    decoded = req |> :cowboy_req.body |> decode_body_from_response
    case decoded do
      {:ok, decoded_body} -> {:ok, %{response | decoded_body: convert_dashes(decoded_body)}}
      {:error, _} -> {:error, %{response | status_code: 400}}
    end
  end

  defp decode_body_from_response({:ok, body, _http_req}), do: Poison.decode(body)
  defp decode_body_from_response({:error, _}), do: {:error, 400}

  defp convert_dashes(map) do
    new_map = Enum.into(map, %{}, fn
      {key, el} when is_binary(el) ->
        key = String.replace(key, "-", "_")
        {key, el}
      {key, map} when is_map(map) ->
        new_key = String.replace(key, "-", "_")
        new_map = convert_dashes(map)
        {new_key, new_map}
      val -> val
    end)
  end
end