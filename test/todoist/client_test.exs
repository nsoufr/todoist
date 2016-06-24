defmodule Todoist.ClientTest do
  use ExUnit.Case, async: true
  alias Todoist.Client

  doctest Todoist.Client

  test "get_token" do
    {:ok, cli} = Client.new("xxxxxx")
    assert "xxxxxx" == Client.get_token(cli)
  end
end
