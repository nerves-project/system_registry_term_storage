defmodule SystemRegistry.TermStorageTest do
  use ExUnit.Case
  doctest SystemRegistry.TermStorage

  alias SystemRegistry, as: SR

  setup ctx do
    %{root: ctx.test}
  end

  test "config values can be persisted", %{root: root} do
    scope = [:config, root, :a]
    {_, task} = update_task(scope, 1, priority: :pa)
    assert %{config: %{^root => %{a: 1}}} = SR.match(%{config: %{root => %{}}})
    Process.exit(task, :kill)
    assert %{config: %{}} = SR.match(%{config: %{root => %{}}})
    assert :ok == SR.TermStorage.persist(scope)
    {_, task} = update_task(scope, 1, priority: :pa)
    assert %{config: %{^root => %{a: 1}}} = SR.match(%{config: %{root => %{}}})
    Process.exit(task, :kill)
    assert %{config: %{^root => %{a: 1}}} = SR.match(%{config: %{root => %{}}})
  end

  defp update_task(key, scope, value) do
    parent = self()
    {:ok, task} =
      Task.start(fn ->
        send(parent, SR.update(key, scope, value))
        Process.sleep(:infinity)
      end)
    assert_receive {:ok, delta}
    {delta, task}
  end

end
