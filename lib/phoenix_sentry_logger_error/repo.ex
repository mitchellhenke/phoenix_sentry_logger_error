defmodule PhoenixSentryLoggerError.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_sentry_logger_error,
    adapter: Ecto.Adapters.Postgres
end
