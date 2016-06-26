defmodule Todoist.ProjectTest do
  use ExUnit.Case, async: true
  doctest Todoist.Project

  import Todoist.Project
  alias Todoist.WriteRequest

  setup do
    {:ok, request: %WriteRequest{}}
  end

  test "add/3", %{request: request} do
    request = request |> add("my_new_project")
    assert [%{type: "project_add", args: %{name: "my_new_project"}}] =
      request.commands
  end

  test "update/3", %{request: request} do
    request = request |> update("project_test", name: "new_name")
    assert [%{type: "project_update", args: %{id: "project_test", name: "new_name"}}] =
      request.commands
  end
end
