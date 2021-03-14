# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_sentry_logger_error,
  ecto_repos: [PhoenixSentryLoggerError.Repo]

# Configures the endpoint
config :phoenix_sentry_logger_error, PhoenixSentryLoggerErrorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jkOaOF5n0R1vPsJjjKszVHmGG8RJ3r/eMJ78LAKA6E2WDyQMxibuXvHAJjsXK4MY",
  render_errors: [view: PhoenixSentryLoggerErrorWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PhoenixSentryLoggerError.PubSub,
  live_view: [signing_salt: "NZPbBiKC"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :logger,
  backends: [LoggerJSON, Sentry.LoggerBackend]

config :logger_json, :backend, metadata: :all

config :logger, Sentry.LoggerBackend,
  level: :warn,
  capture_log_messages: true

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
