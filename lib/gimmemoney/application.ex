defmodule Gimmemoney.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Gimmemoney.Repo,
      # Start the Telemetry supervisor
      GimmemoneyWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Gimmemoney.PubSub},
      # Start the Endpoint (http/https)
      GimmemoneyWeb.Endpoint
      # Start a worker by calling: Gimmemoney.Worker.start_link(arg)
      # {Gimmemoney.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Gimmemoney.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    GimmemoneyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
