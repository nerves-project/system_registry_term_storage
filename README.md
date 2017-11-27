# SystemRegistry.TermStorage

Simple term storage for `SystemRegistry`

## Installation

The package can be installed by adding `system_registry_term_storage` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:system_registry_term_storage, "~> 0.1"}]
end
```

## Usage

Config values can be persisted using the term storage module. Persistence is enabled
for individual leaf nodes. The value for the leaf node is written to a file at the
scope specified. For example, lets say we want to persist the value for the leaf node
`[:config, :a]`. In the application that wants to persist this value, we would call:
`SystemRegistry.TermStorage.persist([:config, :a])`. This cal would typically be made
in the dependencies application start. Once persistence is enabled, term storage will
make its own entry into the config with the value from disk using the priority
`:persistence`. Using this technique, old values will remain saved on the file system
but they will not be made available unless they are told to be persisted. Scopes to be
persisted and the path to write persisted terms to can be set in the application config

```elixir
config :system_registry, SystemRegistry.TermStorage,
  scopes: [
    [:config, :network_interface, "wlan0", :ssid],
    [:config, :network_interface, "wlan0", :psk],
  ],
  path: "/tmp/system_registry"
```

The default path for term storage is at `/tmp/system_registry`

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/system_registry_term_storage](https://hexdocs.pm/system_registry_term_storage).

