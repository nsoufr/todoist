defmodule Todoist.ReadRequest do
  defstruct sync_token: "*", resource_types: ["all"], day_orders_timestamps: nil
end
