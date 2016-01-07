defmodule WokRestCommons.RequestParserSpec do
  alias WokRestCommons.RequestParser
  alias WokRestCommons.Response
  use ESpec

  describe "#parse_resuqest" do
    before do: allow(:cowboy_req).to accept(:body, fn(:cowboy_req) -> {:ok, json_string, :cowboy_req} end)
    subject do: RequestParser.parse_request(%Response{}, :cowboy_req)
    context "when body is correct json" do
      let :json_string, do: "{\"id\": 1, \"names\": [1,2,3]}"
      it do: is_expected |> to(eq(%Response{decoded_body: %{"id" => 1, "names" => [1, 2, 3]}}))
    end
    context "when malformed json" do
      let :json_string, do: "{id: 1,}"
      it do: is_expected |> to(eq(%Response{status_code: 400}))
    end
  end
end
