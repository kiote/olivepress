defmodule Olivepress.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      elixir: "~> 1.11",
      test_coverage: [tool: ExCoveralls],
      dialyzer: dialyzer(),
      deps: deps()
    ]
  end

  # Dependencies listed here are available only for this
  # project and cannot be accessed from applications inside
  # the apps folder.
  #
  # Run "mix help deps" for examples and options.
  defp deps do
    [
      {:quantum, "~> 3.3"},
      {:coinbase_pro_elixir, "~> 0.1.0"},
      # {:coinbase_pro_elixir, path: "../coinbasepro-elixir"},

      # only test deps
      {:excoveralls, "~> 0.10", only: :test},

      # dev and test deps
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false}
    ]
  end

  defp dialyzer do
    [
      plt_core_path: "priv/plts",
      plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
    ]
  end
end
