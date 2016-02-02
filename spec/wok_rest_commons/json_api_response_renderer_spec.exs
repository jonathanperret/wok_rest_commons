defmodule JSONAPIResponseRendererSpec do
  alias WokRESTCommons.JSONAPIResponseRenderer
  use ESpec

  describe "respond_with" do
    let :response, do: %WokRESTCommons.Response{body: "{\"id\": 1}" ,status_code: 200}
    let :default_json_api_headers, do: [{"content-type", "application/vnd.api+json"}, {"Access-Control-Allow-Origin", "*"}]

    subject do: JSONAPIResponseRenderer.respond_with(response, %{})

    it do: is_expected.to eq({200, "{\"id\": 1}", default_json_api_headers, %{}})

  end
end