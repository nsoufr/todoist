defmodule Todoist do
  import Todoist.Client

  def sync(cli, request) do
    response = do_request(cli, request)
    Poison.Parser.parse!(response.body)
  end

  defp json(body), do: Poison.Parser.parse!(body)
end
