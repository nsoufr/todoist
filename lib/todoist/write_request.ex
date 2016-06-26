defmodule Todoist.WriteRequest do
  defstruct commands: []

  @spec add_command(Todoist.Request.t, Todoist.Command.t) :: Todoist.Request.t
  def add_command(request, command) do
    Map.update!(request, :commands, &(List.insert_at(&1, -1, command)))
  end
end
