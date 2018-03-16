use Mix.Config

# Configure your database
config :krumpiri, Krumpiri.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  database: "krumpiri_dev",
  hostname: "localhost",
  port: 5433,
  pool_size: 10
