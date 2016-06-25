# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :exvcr, [
  vcr_cassette_library_dir: "test/fixtures/vcr_cassettes",
  filter_sensitive_data: [
    [pattern: System.get_env("TODOIST_ACCESS_TOKEN"), placeholder: "ACCESS_TOKEN"]
  ]
]
