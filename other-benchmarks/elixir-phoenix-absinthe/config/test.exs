import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :benchmark, BenchmarkWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "CDo2ovJlgd9WbLwz9qK0xcyv0vLT8UHkxitPVrq9e83BeBeQ0mTQcT8kx1eIH8WH",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
