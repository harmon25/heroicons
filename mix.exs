defmodule Heroicons.MixProject do
  use Mix.Project

  def project do
    [
      app: :heroicons,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      name: "Heroicons",
      source_url: "https://github.com/harmon25/heroicons"
    ]
  end

  defp description() do
    "TailwindCSS svg heroicons as surface components"
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package() do
    [
      # These are the default files included in the package
      files: ~w(lib priv .formatter.exs mix.exs README* readme* LICENSE*
                license* CHANGELOG* changelog* src),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/harmon25/heroicons"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:surface, "~> 0.1.0"},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false}
    ]
  end
end
