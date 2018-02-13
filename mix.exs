defmodule SystemRegistry.TermStorage.Mixfile do
  use Mix.Project

  def project do
    [
      app: :system_registry_term_storage,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {SystemRegistry.TermStorage.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:system_registry, "~> 0.7"}
    ]
  end
end
