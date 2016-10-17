defmodule Sequence.Mixfile do
  use Mix.Project

  def project do
    [app: :sequence,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  def application do
    [
      applications: [:logger],
      # Register the application's main entry module
      mod: { Sequence, [] },
      # Register the initial state so that it can be retrieved
      # using Application.get_env
      env: [initial_value: 456],
      # Register the name of the main module
      registered: [ Sequence.Server ]
    ]
  end

  defp deps do
    []
  end
end
