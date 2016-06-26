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

defmodule Todoist.Request.WriteRequest do
  use ExUnit.Case, async: true
  alias Todoist.WriteRequest
  alias Todoist.Project

  import Todoist.Request
  doctest Todoist.Request

  test "parse/1" do
    request = %WriteRequest{} |> Project.add("my_new_project", uuid: "uuid-test")
    cmd = "[{\"uuid\":\"uuid-test\",\"type\":\"project_add\",\"temp_id\":\"uuid-test\",\"args\":{\"name\":\"my_new_project\"}}]"
    assert %{"commands" => cmd } == URI.decode_query(parse(request))
  end
end
