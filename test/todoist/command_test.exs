defmodule Todoist.CommandTest do
  use ExUnit.Case, async: true
  import Todoist.Command
  alias Todoist.Command

  @doctest Todoist.Command

  test "build_from_opts/2" do
    options = [uuid: "1234", temp_id: "1234", name: "project", color: 1]
    cmd = build_from_opts("project_add", options)
    assert %Command{uuid: "1234", temp_id: "1234", args: _} = cmd
  end

  test "put_arg/3" do
    cmd = %Command{} |> put_arg(:id, "1")
    assert %Command{args: %{id: "1"}} == cmd
  end
end
