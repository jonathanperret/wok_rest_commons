defmodule WokRESTCommons.RequestParserSpec do
  alias WokRESTCommons.Response
  use ESpec

  describe "#parse_resuqest" do
    before do: allow(:cowboy_req).to accept(:body, fn(:cowboy_req) -> {:ok, json_string, :cowboy_req} end)
    subject do: WokRESTCommons.RequestParser.parse_request(%Response{}, :cowboy_req)

    context "when body is correct json" do
      let :json_string, do: "{\"id\": 1, \"names\": [1,2,3]}"
      it do: is_expected.to eq({:ok, %Response{decoded_body: %{"id" => 1, "names" => [1, 2, 3]}}})
    end

    context "when malformed json" do
      let :json_string, do: "{id: 1,}"
      it do: is_expected.to eq({:error, %Response{status_code: 400}})
    end

    context "by default it should convert dasherized-attributes to snake_case" do
      let :json_string, do: "{\"id\": 1, \"code-version\": \"1\"}"
      it do: is_expected.to eq({:ok, %Response{decoded_body: %{"id" => 1, "code_version" => "1"}}})
    end

    context "should convenrt nested maps as well" do
      let :json_string do %{ "id" => 1,
                            "code-version" => %{
                              "nested-map-key" => "hello",
                              "nested2" => %{
                                "double-nested-key" => "key"
                              }
                            }
                          } |> Poison.encode!
      end

      it do: is_expected.to eq({:ok, %Response{decoded_body: %{
        "id" => 1,
        "code_version" => %{
          "nested_map_key" => "hello",
          "nested2" => %{
            "double_nested_key" => "key"
          }
        }}
      }})
    end

  end
end
