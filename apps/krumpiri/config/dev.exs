use Mix.Config

# Configure your database
config :krumpiri, Krumpiri.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "krumpiri_dev",
  hostname: "localhost",
  pool_size: 10
