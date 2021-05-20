# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :basketball,
  ecto_repos: [Basketball.Repo]

# Configures the endpoint
config :basketball, BasketballWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SC5DCGMv6cVsfQFVZOHbjai2EYlSqM7aZelgPXJQnHXmjcsnzSOmW79PTqaBxzNv",
  render_errors: [view: BasketballWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Basketball.PubSub,
  live_view: [signing_salt: "d3mb8xAK"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
