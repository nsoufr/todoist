# Todoist

Simple Elixir wrapper for the [Todoist API](http://developer.todoist.com)

## Installation

If [available in Hex](https://hexdocs.pm/todoist/0.0.1), the package can be installed as:

  1. Add todoist to your list of dependencies in `mix.exs`:

        def deps do
          [{:todoist, "~> 0.0.1"}]
        end

  2. Ensure todoist is started before your application:

        def application do
          [applications: [:todoist]]
        end

## Usage

### Sync 
```ex
{:ok, client} = Todoist.Client.new("<YOUR_ACCESS_TOKEN>")
request = Todoist.ReadRequest(resource_types: ["projects"])
response = Todoist.sync(client, request)
```
