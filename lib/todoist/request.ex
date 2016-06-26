defprotocol Todoist.Request do
  def parse(request)
end

defimpl Todoist.Request, for: Todoist.ReadRequest do
  def parse(request) do
    request |> Map.from_struct
            |> Map.update!(:resource_types, &(inspect(&1)))
            |> Enum.filter(&elem(&1, 1))
            |> URI.encode_query
  end
end

defimpl Todoist.Request, for: Todoist.WriteRequest do
  def parse(request) do
    request |> Map.from_struct
            |> Map.update!(:commands, &(Poison.encode!(&1)))
            |> URI.encode_query
  end
end
