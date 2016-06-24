defmodule Todoist.Client do
  use GenServer

  defstruct access_token: nil

  @endpoint "https://todoist.com/API/v7/sync"

  @type access_token :: binary
  @type t :: %__MODULE__{access_token: access_token}

  @spec new(access_token) :: GenServer.on_start
  def new(access_token, options \\ []) do
    GenServer.start_link(__MODULE__, %__MODULE__{access_token: access_token}, options)
  end

  @spec get_token(pid) :: binary
  def get_token(client) do
    GenServer.call(client, :get_token)
  end

  def do_request(client, request) do
    GenServer.call(client, {:do_request, request})
  end

  def handle_call(:get_token, _from, state) do
    {:reply, state.access_token, state}
  end

  def handle_call({:do_request, request}, _from, state) do
    request_query = request |> Map.put(:token, state.access_token)
                            |> Todoist.Request.parse

    url = "#{@endpoint}?#{request_query}"
    response =  HTTPotion.post(url)
    {:reply, response, state}
  end
end
