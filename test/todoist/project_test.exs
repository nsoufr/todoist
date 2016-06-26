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

  test "archive/2 when list", %{request: request} do
    request = request |> archive(["project_test"])
    assert [%{type: "project_archive", args: %{ids: ["project_test"]}}] =
      request.commands
  end

  test "archive/2", %{request: request} do
    request = request |> archive("project_test")
    assert [%{type: "project_archive", args: %{ids: ["project_test"]}}] =
      request.commands
  end

  test "unarchive/2 when list", %{request: request} do
    request = request |> unarchive(["project_test"])
    assert [%{type: "project_unarchive", args: %{ids: ["project_test"]}}] =
      request.commands
  end

  test "unarchive/3", %{request: request} do
    request = request |> unarchive("project_test")
    assert [%{type: "project_unarchive", args: %{ids: ["project_test"]}}] =
      request.commands
  end

  test "update_orders_indents", %{request: request} do
    request = request |> update_orders_indents(%{"1923440" => [42, 1]})
    assert [%{type: "project_update_orders_indents", args: %{"ids_to_orders_indents" => %{"1923440" => [42,1]}}}] =
      request.commands
  end
end
