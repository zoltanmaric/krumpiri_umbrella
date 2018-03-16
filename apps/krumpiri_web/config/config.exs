# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :krumpiri_web,
  namespace: KrumpiriWeb,
  ecto_repos: [Krumpiri.Repo]

# Configures the endpoint
config :krumpiri_web, KrumpiriWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "w/qVzhyakfKYkgSA5u/ypo4gvRqDK37zNFjLsRA2KKl3C8bKdF4U8QRIsfn5oel4",
  render_errors: [view: KrumpiriWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: KrumpiriWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :krumpiri_web, :generators,
  context_app: :krumpiri

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
