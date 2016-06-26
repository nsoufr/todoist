defmodule Todoist do
  import Todoist.Client

  @doc """
  Executes request over a client.

  ## Examples

      iex> {:ok, cli} = Client.new("my_token")
      iex> request = %ReadRequest{resource_types: ["projects"]}
      iex> sync(cli, request)
      %{"items" => ...}
  """
  @spec sync(Todoist.Request.t, Todoist.Client.t) :: map
  def sync(request, client) do
    response = do_request(client, request)
    json(response.body)
  end

  defp json(body), do: Poison.Parser.parse!(body)
end
