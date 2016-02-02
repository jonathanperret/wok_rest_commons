defmodule JSONAPIResponseRendererSpec do
  use ESpec

  describe "render_response" do
    let :response, do: %WokRestCommons.Response{body: "{\"id\": 1}" ,status_code: 200}
    let :default_json_api_headers, do: [{"content-type", "application/vnd.api+json"}, {"Access-Control-Allow-Origin", "*"}]

    subject do: JSONAPIResponseRenderer.render_response(response, %{})

    it do: is_expected.to eq({200, "{\"id\": 1}", default_json_api_headers, %{}})

  end
end