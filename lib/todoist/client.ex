defmodule Todoist.Client do
  @endpoint "https://todoist.com/API/v7/sync"

  defstruct auth: nil

  @type auth :: %{access_token: binary}
  @type t :: %__MODULE__{auth: auth}

  @spec new(auth) :: t
  def new(auth), do: auth
end
