defmodule Todoist.Integration.ProjectTest do
  use ExUnit.Case
  use ExVCR.Mock

  alias Todoist.WriteRequest
  alias Todoist.Project

  import Todoist

  setup_all do
    {:ok, client} = Todoist.Client.new(System.get_env("TODOIST_ACCESS_TOKEN"))
    {:ok, client: client, request: %WriteRequest{}}
  end

  test "adding a project", %{client: client, request: request} do
    use_cassette "project#add" do
      request = request |> Project.add("my_test_project", uuid: "project_add", temp_id: "project_add")
      assert %{"sync_status" => %{"project_add"=> "ok" }} = sync(request, client)
    end
  end

  test "updating a project", %{client: client, request: request} do
    use_cassette "project#update" do
      request = Project.update(request, "project_add", name: "My new name", uuid: "project_update_test")
      assert %{"sync_status" => %{"project_update_test" => "ok" }} = sync(request, client)
    end
  end

  test "archiving a project", %{client: client, request: request} do
    use_cassette "project#archive" do
      request = Project.archive(request, "project_add", uuid: "project_archive_test")
      assert %{"sync_status" => %{"project_archive_test" => "ok"}} = sync(request, client)
    end
  end

  test "unarchiving a project", %{client: client, request: request} do
    use_cassette "project#unarchive" do
      request = Project.unarchive(request, "project_add", uuid: "project_unarchive_test")
      assert %{"sync_status" => %{"project_unarchive_test" => "ok"}} = sync(request, client)
    end
  end

  test "deleting a project", %{client: client, request: request} do
    use_cassette "project#delete" do
      request = Project.delete(request, "project_add", uuid: "project_delete_test")
      assert %{"sync_status" => %{"project_delete_test" => "ok"}} = sync(request, client)
    end
  end
end
