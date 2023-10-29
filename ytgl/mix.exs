defmodule Ytgl.MixProject do
  use Mix.Project

  def project do
    [
      app: :ytgl,
      version: "0.1.0",
      elixir: "~> 1.15",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      escript: escript(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end


  def escript do
    [main_module: Ytgl.CLI]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    []
  end
end
