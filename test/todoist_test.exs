defmodule TodoistTest do
  use ExUnit.Case
  use ExVCR.Mock

  import Todoist

  test "sync/2" do
    use_cassette "sync" do
      {:ok, client} = Todoist.Client.new(System.get_env("TODOIST_ACCESS_TOKEN"))
      request = %Todoist.ReadRequest{}
      assert %{"items" => _} = sync(request, client)
    end
  end
end
