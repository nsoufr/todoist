defmodule Todoist.ProjectTest do
  use ExUnit.Case, async: true
  doctest Todoist.Project

  import Todoist.Project
  alias Todoist.WriteRequest

  test "add/3" do
    request = %WriteRequest{} |> add("my_new_project")
    cmd = %{type: "project_add", args: [name: "my_new_project"]}
    assert [^cmd] = request.commands
  end
end
