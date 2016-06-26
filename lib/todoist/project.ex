defmodule Todoist.Project do

  @doc """
  Adds a new command structure to Request.

  See: https://developer.todoist.com/?shell#add-a-project

  ## Examples
      request = WriteRequest{} |> add("my_new_project")
      request.commands
      [%{type: "project_add", uuid: ..., args: %{name: "my_new_project"}}]
  """
  @spec add(Todoist.WriteRequest.t, binary, Keyword.t) :: Todoist.WriteRequest.t
  def add(request, name, options \\ []) do
    # TODO: Found a best way to do this, maybe by requiring it from the user.
    # See:https://developer.todoist.com/?shell#write-resources
    uuid    = Keyword.get(options, :uuid, UUID.uuid1())
    temp_id = Keyword.get(options, :temp_id, uuid)

    args = process_args(name, options)
    cmd = %{type: "project_add", args: args} |> Map.put(:uuid, uuid)
                                             |> Map.put(:temp_id, temp_id)

    request |> Map.update!(:commands, &(List.insert_at(&1, -1, cmd)))
  end

  @spec process_args(binary, Keyword.t) :: map
  defp process_args(name, options) do
    options |> Keyword.drop([:uuid, :temp_id])
            |> Keyword.put(:name, name)
            |> Enum.into(%{})
  end
end
