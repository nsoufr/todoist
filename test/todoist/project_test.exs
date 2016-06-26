defmodule Todoist.ProjectTest do
  use ExUnit.Case, async: true
  doctest Todoist.Project

  import Todoist.Project
  alias Todoist.WriteRequest

  test "add/3" do
    request = %WriteRequest{} |> add("my_new_project")
    assert [%{type: "project_add", uuid: _, args: %{name: "my_new_project"}}] =
      request.commands
  end
end
