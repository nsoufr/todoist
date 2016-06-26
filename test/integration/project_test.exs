defmodule Todoist.Integration.ProjectTest do
  use ExUnit.Case
  use ExVCR.Mock

  alias Todoist.WriteRequest
  alias Todoist.Project

  setup_all do
    HTTPotion.start

    {:ok, client} = Todoist.Client.new(System.get_env("TODOIST_ACCESS_TOKEN"))
    {:ok, client: client, request: %WriteRequest{}}
  end

  test "adding a project", %{client: client, request: request} do
    use_cassette "project#add" do
      request = request |> Project.add("my_test_project", uuid: "project_add", temp_id: "project_add")
      assert %{"sync_status" => %{"project_add"=> "ok" }} = Todoist.sync(client, request)
    end
  end
end
