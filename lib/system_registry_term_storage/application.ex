defmodule SystemRegistry.TermStorage.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    # List all child processes to be supervised
    term_storage_opts =
      Application.get_env(:system_registry, SystemRegistry.TermStorage)

    children = [
      worker(SystemRegistry.TermStorage, [term_storage_opts])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SystemRegistry.TermStorage.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
