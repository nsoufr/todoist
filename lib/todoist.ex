defmodule Todoist do
  alias Todoist.Client

  # {:ok, cli} = Todoist.Client.new(token)
  # request = %Todoist.ReadRequest{}
  # {:ok, result} = Todoist.sync(cli, request)
  # {:error, result} = Todoist.sync(cli, request)

  def sync(cli, request) do
    response = Client.do_request(cli, request)
    Poison.Parser.parse!(response.body)
  end
end
