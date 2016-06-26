defmodule Todoist.Command do
  defstruct type: nil, uuid: nil, temp_id: nil, args: %{}

  @type t :: %__MODULE__{}

  @spec build_from_opts(binary, Keyword.t) :: t
  def build_from_opts(type, options) do
    uuid    = Keyword.get(options, :uuid, UUID.uuid1())
    temp_id = Keyword.get(options, :temp_id, uuid)

    args = options |> Keyword.drop([:uuid, :temp_id])
                   |> Enum.into(%{})

    %__MODULE__{type: type, uuid: uuid, temp_id: temp_id, args: args}
  end

  @spec put_arg(t, :atom | binary, map) :: t
  def put_arg(command, key, value) do
    command |> Map.update!(:args, fn(args)-> args |> Map.put(key, value) end)
  end
end
