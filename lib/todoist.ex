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
  @spec sync(Todoist.Client.t, Todoist.Request.t) :: map
  def sync(cli, request) do
    response = do_request(cli, request)
    json(response.body)
  end

  defp json(body), do: Poison.Parser.parse!(body)
end
