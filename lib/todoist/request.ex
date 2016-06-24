defprotocol Todoist.Request do
  def parse(item)
end

defimpl Todoist.Request, for: Todoist.ReadRequest do
  def parse(item) do

    check_nil = fn(x) ->
                  case x do
                   {_, nil} -> true
                   {_,_} -> false
                  end
                end

    item |> Map.from_struct
         |> Map.update!(:resource_types, &(Poison.Encoder.encode(&1, []) |> List.to_string ))
         |> Enum.reject(check_nil)
         |> IO.inspect
         |> URI.encode_query
  end
end
