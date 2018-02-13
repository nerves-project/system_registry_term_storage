defmodule SystemRegistry.TermStorage.Mixfile do
  use Mix.Project

  def project do
    [
      app: :system_registry_term_storage,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
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
      {:ex_doc, "~> 0.15", only: :dev},
      {:system_registry, "~> 0.7"}
    ]
  end

  defp description do
    """
    Simple term storage for System Registry
    """
  end

  defp package do
    [maintainers: ["Justin Schneck", "Frank Hunleth"],
     licenses: ["Apache 2.0"],
     links: %{"Github" => "https://github.com/nerves-project/system_registry_term_storage"}]
  end
end
