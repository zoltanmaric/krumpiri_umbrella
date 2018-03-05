# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :krumpiri_web,
  namespace: KrumpiriWeb

# Configures the endpoint
config :krumpiri_web, KrumpiriWebWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Sws1ybGs/xxibQLpJbhgI4zOVs0rDErEP5TxHHf1dzFnp+OBF8cB83y5lyK7aP5T",
  render_errors: [view: KrumpiriWebWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: KrumpiriWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
