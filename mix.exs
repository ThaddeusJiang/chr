defmodule Chr.MixProject do
  use Mix.Project

  def project do
    [
      app: :chr,
      version: "0.1.0",
      elixir: "~> 1.15",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      escript: escript(),
      name: "chr",
      source_url: "https://github.com/ThaddeusJiang/chr",
      authors: ["ThaddeusJiang"],
      docs: [
        main: "readme",
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:owl, "~> 0.8"},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    A command line tool for generating a commands history report.
    """
  end

  defp package do
    [
      name: "chr",
      files: ~w(lib .formatter.exs mix.exs README* LICENSE*),
      licenses: ["MIT"],
      maintainers: ["ThaddeusJiang"],
      links: %{"GitHub" => "https://github.com/ThaddeusJiang/chr"}
    ]
  end

  defp escript do
    [main_module: Chr.Cli]
  end
end
