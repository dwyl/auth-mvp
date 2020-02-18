use Mix.Config

# Configure your database
config :auth_mvp, AuthMvp.Repo,
  username: "postgres",
  password: "postgres",
  database: "auth_mvp_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :auth_mvp, AuthMvpWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
config :auth_mvp, :elixir_auth_google, AuthMvp.Mock.ElixirAuthGoogle
config :auth_mvp, :elixir_auth_github, AuthMvp.Mock.ElixirAuthGithub
config :joken, default_signer: "secret"
