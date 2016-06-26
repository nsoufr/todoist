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
      request = %WriteRequest |> update("id", name: "new title")
      request.commands
      [%{type: "project_update", uuid: ..., args: %{id: "id", name: "new_title"}}]
  """
  @spec update(Todoist.WriteRequest.t, binary | integer, Keyword.t) :: Todoist.WriteRequest.t
  def update(request, id, options \\ []) do
    cmd = Command.build_from_opts("project_update", options)
    cmd = Command.put_arg(cmd, :id, id)

    WriteRequest.add_command(request, cmd)
  end

  @doc """
  Adds an archive command structure to Request

  See: https://developer.todoist.com/#archive-a-project

  Options:
    * `:uuid` Unique string ID for the command: It will be automatically
    generated if not passed.

  # Examples
    request = %WriteRequest |> archive(["temp_id"])
    request.commands
    [%{type: "project_archive", uuid: ..., args: %{ids: ["temp_id"}}]
  """

  def archive(request, ids, options \\ [])

  @spec archive(Todoist.WriteRequest.t, list, Keyword.t) :: Todoist.WriteRequest.t
  def archive(request, ids, options) when is_list(ids) do
    cmd = Command.build_from_opts("project_archive", options)
    cmd = Command.put_arg(cmd, :ids, ids)

    WriteRequest.add_command(request, cmd)
  end

  @spec archive(Todoist.WriteRequest.t, integer | binary | atom, Keyword.t) :: Todoist.WriteRequest.t
  def archive(request, id, options), do: archive(request, [id], options)


  @doc """
  Adds an unarchive command structure to Request

  See: https://developer.todoist.com/#unarchive-a-project

  Options:
    * `:uuid` Unique string ID for the command: It will be automatically
    generated if not passed.

  # Examples
    request = %WriteRequest |> unarchive(["temp_id"])
    request.commands
    [%{type: "project_unarchive", uuid: ..., args: %{ids: ["temp_id"}}]
  """

  def unarchive(request, ids, options \\ [])

  @spec unarchive(Todoist.WriteRequest.t, list, Keyword.t) :: Todoist.WriteRequest.t
  def unarchive(request, ids, options) when is_list(ids) do
    cmd = Command.build_from_opts("project_unarchive", options)
    cmd = Command.put_arg(cmd, :ids, ids)

    WriteRequest.add_command(request, cmd)
  end

  @spec unarchive(Todoist.WriteRequest.t, integer | binary | atom, Keyword.t) :: Todoist.WriteRequest.t
  def unarchive(request, id, options), do: unarchive(request, [id], options)
end
