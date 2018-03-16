use Mix.Config

# Configure your database
config :krumpiri, Krumpiri.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "krumpiri_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
