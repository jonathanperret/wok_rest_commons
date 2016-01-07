defmodule WokRestCommons.Response do
  defstruct current_user: %{},
            body: "",
            decoded_body: nil,
            errors: nil,
            headers: [{"content-type", "application/vnd.api+json"},{"Access-Control-Allow-Origin", "*"}],
            resource: nil,
            status_code: nil,
            models_to_send: %{}
end