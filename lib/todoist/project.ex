defmodule Todoist.Project do
  alias Todoist.Command
  alias Todoist.WriteRequest

  @doc """
  Adds a new command structure to Request.

  See: https://developer.todoist.com/?shell#add-a-project

  Options:
    * `:uuid` Unique string ID for the command: It will be automatically
      generated if not passed.

    * `:temp_id` Temporary resource ID. Only specified for commands that
    create new resource (“item_add” command). More details about this below.

    * `:color` The color of the project (a number between 0 and 11, or
      between 0 and 21 for premium users).

    * `:indent` The indent of the item (a number between 1 and 4, where
      1 is top-level).

    * `:item_order` Project’s order in the project list (a number, where
      the smallest value should place the project at the top).

  ## Examples
      request = %WriteRequest{} |> add("my_new_project")
      request.commands
      [%{type: "project_add", uuid: ..., args: %{name: "my_new_project"}}]
  """
  @spec add(Todoist.WriteRequest.t, binary, Keyword.t) :: Todoist.WriteRequest.t
  def add(request, name, options \\ []) do
    cmd = Command.build_from_opts("project_add", options)
    cmd = Command.put_arg(cmd, :name, name)
    request |> WriteRequest.add_command(cmd)
  end

  @doc """
  Adds an update command structure to Request.

  See: https://developer.todoist.com/?shell#update-a-project

  Options:
    * `:uuid` Unique string ID for the command: It will be automatically
      generated if not passed.

    * `:temp_id` Temporary resource ID. Only specified for commands that
    create new resource (“item_add” command). More details about this below.

    * `:name` The name of the project (a string value).

    * `:color` The color of the project (a number between 0 and 11, or
    between 0 and 21 for premium users).

    * `:indent` The indent of the item (a number between 1 and 4,
    where 1 is top-level).

    * `:item_order` Project’s order in the project list (a number,
    where the smallest value should place the project at the top).

    * `:collapsed` Whether the project’s sub-projects are collapsed.
      (where 1 is true and 0 is false)

    # Examples
      request = %WriteRequest |> update("my_project_id_or_temp_id")
      request.commands
      [%{type}]
  """
  @spec update(Todoist.WriteRequest.t, binary | integer, Keyword.t) :: Todoist.WriteRequest.t
  def update(request, id, options \\ []) do
    cmd = Command.build_from_opts("project_update", options)
    cmd = Command.put_arg(cmd, :id, id)

    WriteRequest.add_command(request, cmd)
  end
end
