defmodule WokRestCommons.Mixfile do
  use Mix.Project

  def project do
    [app: :wok_rest_commons,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     preferred_cli_env: [espec: :test],
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:poison, "~> 1.5"},
      {:wok_espec, "0.0.1", git: "git@gitlab.botsunit.com:developer/wok_espec.git", branch: "master"}
    ]
  end
end
