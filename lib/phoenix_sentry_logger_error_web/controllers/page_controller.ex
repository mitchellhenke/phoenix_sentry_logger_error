defmodule PhoenixSentryLoggerErrorWeb.PageController do
  use PhoenixSentryLoggerErrorWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
