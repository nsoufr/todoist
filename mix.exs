defmodule Todoist.Mixfile do
  use Mix.Project

  def project do
    [app: :todoist,
     version: "0.0.2",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpotion]]
  end

  defp description do
    """
    A simple Todoist Elixir wrapper
    """
  end

  defp package do
    [
      name: :todoist,
      files: ["lib", "mix.exs", "README.md","LICENSE"],
      maintainers: ["Nando Sousa"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/nandosousafr/todoist",
               "Docs" => "https://github.com/nandosousafr/todoist"}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:ex_doc, ">= 0.0.0", only: :dev},
     {:exvcr, "~> 0.7", only: :test},
     {:uuid, "~> 1.1"},
     {:httpotion, "~> 2.2.2"},
     {:poison, "~> 2.0"}]
  end
end
