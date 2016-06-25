defmodule Todoist.Request.ReadRequest do
  use ExUnit.Case, async: true
  alias Todoist.ReadRequest

  import Todoist.Request

  doctest Todoist.Request

  test "parse/1" do
    request = %ReadRequest{}
    assert "resource_types=[\"all\"]&sync_token=*" == URI.decode(parse(request))
  end
end
