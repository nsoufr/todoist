defmodule Todoist.Project do

  @doc """
  Adds a new command structure to Request.

  See: https://developer.todoist.com/?shell#add-a-project

  ## Examples

      iex> alias Todoist.Project
      iex> request = %Todoist.WriteRequest{} |> Project.add("my_new_project")
      iex> request.commands
      [%{type: "project_add", args: [name: "my_new_project"]}]
  """
  @spec add(Todoist.WriteRequest.t, binary, Keyword.t) :: Todoist.WriteRequest.t
  def add(request, name, options \\ []) do
    args = options |> Keyword.put(:name, name)
    cmd = %{type: "project_add", args: args}
    request |> Map.update!(:commands, &(List.insert_at(&1, -1, cmd)))
  end
end
