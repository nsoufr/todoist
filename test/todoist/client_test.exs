defmodule Todoist.ClientTest do
  use ExUnit.Case, async: true
  alias Todoist.Client

  doctest Todoist.Client

  test "default construction" do
    cli = Client.new(%{access_token: "xxx"})
    assert cli.access_token == "xxx"
  end
end
